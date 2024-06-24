import 'package:flutter/material.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';
import 'package:task_manager_app/core/widgets/app_button_widget.dart';
import 'package:task_manager_app/core/widgets/app_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
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
            hintText: "Enter Your Username",
            validator: (value) {},
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
            text: 'Register',
            onTap: () {},
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
