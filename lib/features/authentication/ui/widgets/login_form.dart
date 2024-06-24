import 'package:flutter/material.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';
import 'package:task_manager_app/core/widgets/app_button_widget.dart';
import 'package:task_manager_app/core/widgets/app_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
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
            hintText: "Enter Your Email",
            validator: (value) {},
          ),
          verticalSpace(16),
          Text(
            'Password',
            style: AppTextThemes.font14WhiteRegular,
          ),
          verticalSpace(8),
          AppTextFormField(
            hintText: "Enter Your Password",
            validator: (value) {},
          ),
          verticalSpace(24),
          AppButtonWidget(
            text: 'Login',
            onTap: () {},
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
