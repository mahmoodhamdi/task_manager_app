import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/core/constants/app_constants.dart';
import 'package:task_manager_app/core/constants/app_enums.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/routes/routes.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';
import 'package:task_manager_app/core/utils/utils.dart';
import 'package:task_manager_app/core/utils/validation.dart';
import 'package:task_manager_app/core/widgets/app_button_widget.dart';
import 'package:task_manager_app/core/widgets/app_text_form_field.dart';
import 'package:task_manager_app/features/authentication/logic/cubits/registerwithemailandpassword/register_with_email_and_password_cubit.dart';
import 'package:task_manager_app/features/authentication/logic/cubits/registerwithemailandpassword/registerwithemailandpassword_state.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterWithEmailAndPasswordCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Register',
            style: AppTextThemes.font32WhiteBold,
          ),
          verticalSpace(16),
          const Text(
            "Username",
          ),
          verticalSpace(8),
          AppTextFormField(
            controller: context
                .read<RegisterWithEmailAndPasswordCubit>()
                .usernameController,
            hintText: "Enter Your Username",
            validator: (value) {
              return AppValidator.validateEmpty(value, fieldName: "Username");
            },
          ),
          verticalSpace(16),
          Text(
            'Email',
            style: AppTextThemes.font14WhiteRegular,
          ),
          verticalSpace(8),
          AppTextFormField(
            controller: context
                .read<RegisterWithEmailAndPasswordCubit>()
                .emailController,
            hintText: "Enter Your Email",
            validator: (value) {
              return AppValidator.validateEmail(value);
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
                .read<RegisterWithEmailAndPasswordCubit>()
                .passwordController,
            hintText: "Enter Your Password",
            validator: (value) {
              return AppValidator.validatePassword(value);
            },
          ),
          verticalSpace(24),
          BlocConsumer<RegisterWithEmailAndPasswordCubit,
              RegisterWithEmailAndPasswordState>(
            listener: (context, state) {
              if (state is RegisterWithEmailAndPasswordFailure) {
                Utils.showSnackBar(context, state.error, SnackBarType.error);
              }
              if (state is RegisterWithEmailAndPasswordSuccess) {
                Utils.showSnackBar(context, 'Email Created Successfully!',
                    SnackBarType.success);
                Future.delayed(navigationDuration, () {
                  Navigator.pushNamedAndRemoveUntil(
                     arguments: state.user,
                      context, Routes.homeView, (route) => false); // replace with your route
                });
              }
            },
            builder: (context, state) {
              if (state is RegisterWithEmailAndPasswordLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return AppButtonWidget(
                text: 'Register',
                onTap: () {
                  validateThenRegister(context);
                },
                width: double.infinity,
              );
            },
          ),
        ],
      ),
    );
  }

  void validateThenRegister(BuildContext context) {
    if (context
        .read<RegisterWithEmailAndPasswordCubit>()
        .formKey
        .currentState!
        .validate()) {
      context
          .read<RegisterWithEmailAndPasswordCubit>()
          .registerWithEmailAndPassword();
    }
  }
}
