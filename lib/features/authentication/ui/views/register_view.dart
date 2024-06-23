import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/constants/app_colors.dart';
import 'package:task_manager_app/core/constants/app_images.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';
import 'package:task_manager_app/core/widgets/app_button_widget.dart';
import 'package:task_manager_app/core/widgets/app_divider_widget.dart';
import 'package:task_manager_app/core/widgets/app_text_form_field.dart';
import 'package:task_manager_app/features/authentication/ui/widgets/register_form.dart';

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
                const RegisterForm(),
                verticalSpace(16),
                const AppDividerWidget(),
                verticalSpace(24),
                AppButtonWidget(
                  hideIcon: true,
                  text: 'Register with Google',
                  onTap: () {},
                  width: double.infinity,
                  textStyle: AppTextThemes.font16WhiteRegular.copyWith(
                    color: AppColors.white.withOpacity(0.87),
                  ),
                  backgroundColor: AppColors.black,
                  borderColor: AppColors.primaryColor,
                ),
                verticalSpace(16),
                AppButtonWidget(
                  hideIcon: true,
                  text: 'Register with Apple',
                  onTap: () {},
                  width: double.infinity,
                  textStyle: AppTextThemes.font16WhiteRegular.copyWith(
                    color: AppColors.white.withOpacity(0.87),
                  ),
                  backgroundColor: AppColors.black,
                  borderColor: AppColors.primaryColor,
                  iconPath: AppImages.apple,
                ),
                verticalSpace(32),
                Text.rich(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
