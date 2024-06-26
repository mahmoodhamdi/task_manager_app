import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/core/constants/app_constants.dart';
import 'package:task_manager_app/core/constants/app_enums.dart';
import 'package:task_manager_app/core/databases/database_helper.dart';
import 'package:task_manager_app/core/di/service_locator.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/routes/routes.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';
import 'package:task_manager_app/core/utils/utils.dart';
import 'package:task_manager_app/core/utils/validation.dart';
import 'package:task_manager_app/core/widgets/app_button_widget.dart';
import 'package:task_manager_app/core/widgets/app_text_form_field.dart';
import 'package:task_manager_app/features/authentication/logic/cubits/login_with_email_and_password_cubit.dart';
import 'package:task_manager_app/features/authentication/logic/cubits/login_with_email_and_password_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginWithEmailAndPasswordCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Login',
            style: AppTextThemes.font32WhiteBold,
          ),
          verticalSpace(16),
          Text(
            'Email',
            style: AppTextThemes.font14WhiteRegular,
          ),
          verticalSpace(8),
          AppTextFormField(
            controller:
                context.read<LoginWithEmailAndPasswordCubit>().emailController,
            hintText: "Enter Your Email",
            validator: (value) {
              return AppValidator.validateEmpty(value, fieldName: "Email");
            },
          ),
          verticalSpace(16),
          Text(
            'Password',
            style: AppTextThemes.font14WhiteRegular,
          ),
          verticalSpace(8),
          AppTextFormField(
            controller: context
                .read<LoginWithEmailAndPasswordCubit>()
                .passwordController,
            hintText: "Enter Your Password",
            validator: (value) {
              return AppValidator.validateEmpty(value, fieldName: "Password");
            },
          ),
          verticalSpace(24),
          BlocConsumer<LoginWithEmailAndPasswordCubit,
              LoginWithEmailAndPasswordState>(
            listener: (context, state) {
              if (state is LoginWithEmailAndPasswordFailure) {
                Utils.showSnackBar(context, 'Login Failed: ${state.error}',
                    SnackBarType.error);
              } else if (state is LoginWithEmailAndPasswordSuccess) {
                Utils.showSnackBar(
                    context, 'Welcome Back!', SnackBarType.success);
                    final db=getIt<DatabaseHelper>();
                    db.insertSetting("isLoggedIn", "true");
                Future.delayed(navigationDuration, () {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.homeView,
                      arguments: state.user,
                      (route) => false); // replace with your route
                });
              }
            },
            builder: (context, state) {
              if (state is LoginWithEmailAndPasswordLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return AppButtonWidget(
                text: 'Login',
                onTap: () {
                  validateThenLogin(context);
                },
                width: double.infinity,
              );
            },
          ),
        ],
      ),
    );
  }
}

void validateThenLogin(BuildContext context) {
  if (context
      .read<LoginWithEmailAndPasswordCubit>()
      .formKey
      .currentState!
      .validate()) {
    context.read<LoginWithEmailAndPasswordCubit>().loginWithEmailAndPassword();
  }
}
