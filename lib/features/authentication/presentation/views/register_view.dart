import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/constants/app_colors.dart';
import 'package:task_manager_app/core/constants/app_constants.dart';
import 'package:task_manager_app/core/constants/app_enums.dart';
import 'package:task_manager_app/core/constants/app_images.dart';
import 'package:task_manager_app/core/di/service_locator.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/routes/routes.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';
import 'package:task_manager_app/core/utils/utils.dart';
import 'package:task_manager_app/core/widgets/app_button_widget.dart';
import 'package:task_manager_app/core/widgets/app_divider_widget.dart';
import 'package:task_manager_app/features/authentication/data/models/user_model.dart';
import 'package:task_manager_app/features/authentication/presentation/manager/cubits/google_sign_in/google_sign_in_cubit.dart';
import 'package:task_manager_app/features/authentication/presentation/manager/cubits/google_sign_in/google_sign_in_state.dart';
import 'package:task_manager_app/features/authentication/presentation/manager/cubits/registerwithemailandpassword/register_with_email_and_password_cubit.dart';
import 'package:task_manager_app/features/authentication/presentation/widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 56.0.h, horizontal: 24.0.w),
            child: Column(
              children: [
                BlocProvider(
                  create: (context) =>
                      getIt<RegisterWithEmailAndPasswordCubit>(),
                  child: const RegisterForm(),
                ),
                verticalSpace(16),
                const AppDividerWidget(),
                verticalSpace(24),
                BlocProvider(
                  create: (context) => GoogleSignInCubit(),
                  child: BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
                    listener: (context, state) {
                      if (state is GoogleSignInFailure) {
                        Utils.showSnackBar(
                            context,
                            'Register Failed: ${state.error}',
                            SnackBarType.error);
                      } else if (state is GoogleSignInSuccess) {
                        Utils.showSnackBar(
                            context,
                            'Email Created Successfully!',
                            SnackBarType.success);
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
                      if (state is GoogleSignInLoading) {
                        return const CircularProgressIndicator();
                      }

                      return AppButtonWidget(
                        hideIcon: true,
                        text: 'Register with Google',
                        onTap: () {
                          context.read<GoogleSignInCubit>().signInWithGoogle();
                        },
                        width: double.infinity,
                        textStyle: AppTextThemes.font16WhiteRegular.copyWith(
                          color: AppColors.white.withOpacity(0.87),
                        ),
                        backgroundColor: AppColors.black,
                        borderColor: AppColors.primaryColor,
                      );
                    },
                  ),
                ),
                verticalSpace(16),
                AppButtonWidget(
                  hideIcon: true,
                  text: 'Register with Apple',
                  onTap: () {
                    Utils.showSnackBar(
                        context, 'Coming Soon', SnackBarType.info);
                  },
                  width: double.infinity,
                  textStyle: AppTextThemes.font16WhiteRegular.copyWith(
                    color: AppColors.white.withOpacity(0.87),
                  ),
                  backgroundColor: AppColors.black,
                  borderColor: AppColors.primaryColor,
                  iconPath: AppImages.apple,
                ),
                verticalSpace(32),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.loginView);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: AppTextThemes.font12GreyRegular,
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: AppTextThemes.font12WhiteRegular.copyWith(
                              color: AppColors.primaryColor.withOpacity(0.87)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
