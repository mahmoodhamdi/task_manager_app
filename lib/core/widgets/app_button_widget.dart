import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager_app/core/constants/app_colors.dart';
import 'package:task_manager_app/core/constants/app_images.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.width,
    this.height,
    this.textStyle,
    this.hideIcon,
    this.iconHeight,
    this.iconWidth,
    this.iconColor,
    this.iconPath,
    this.onTap,
  });
  final void Function()? onTap;
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final bool? hideIcon;
  final double? iconHeight;
  final double? iconWidth;
  final Color? iconColor;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 90.0.w,
        height: height ?? 48.h,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          border: Border.all(
            width: 1,
            color: borderColor ?? AppColors.primaryColor,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hideIcon != true
                  ? const SizedBox.shrink()
                  : SvgPicture.asset(
                      iconPath ?? AppImages.google,
                      width: iconWidth ?? 24.w,
                      height: iconHeight ?? 24.h,
                    ),
              horizontalSpace(8.w),
              Text(
                text,
                style: textStyle ?? AppTextThemes.font16WhiteRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
