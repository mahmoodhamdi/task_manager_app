import 'package:flutter/material.dart';
import 'package:task_manager_app/core/constants/app_strings.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    this.text,
    this.onPressed,
    this.textStyle,
  });
  final String? text;
  final void Function()? onPressed;
  final TextStyle? textStyle;
// text_button_widget.dart
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text ?? AppStrings.skip,
          style: textStyle ?? AppTextThemes.font16LightWhiteRegular,
        ));
  }
}
