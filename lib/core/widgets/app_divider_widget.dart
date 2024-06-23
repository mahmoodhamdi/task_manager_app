import 'package:flutter/material.dart';
import 'package:task_manager_app/core/constants/app_colors.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';

class AppDividerWidget extends StatelessWidget {
  const AppDividerWidget({
    super.key,
  });
//app_divider_widget.dart
  @override
  Widget build(BuildContext context) {
    return Row(
        //divider
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.dividerColor,
              thickness: 1,
            ),
          ),
          horizontalSpace(8),
          Text(
            'or',
            style: AppTextThemes.font14WhiteRegular,
          ),
          horizontalSpace(8),
          const Expanded(
            child: Divider(
              color: AppColors.dividerColor,
              thickness: 1,
            ),
          ),
        ]);
  }
}
