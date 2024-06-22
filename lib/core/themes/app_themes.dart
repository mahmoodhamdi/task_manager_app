import 'package:flutter/material.dart';
import 'package:task_manager_app/core/constants/app_sizes.dart';
import 'package:task_manager_app/core/constants/app_colors.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBlue,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textFieldBackgroundColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldBorderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      hintStyle: TextStyle(color: AppColors.textFieldHintColor),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.buttonColor,
      textTheme: ButtonTextTheme.primary,
    ),
    dividerColor: AppColors.dividerColor,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.darkBlue,
      contentTextStyle: const TextStyle(color: AppColors.textColor),
      actionTextColor: AppColors.primaryColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.darkBlue,
      titleTextStyle: TextStyle(
        color: AppColors.textColor,
        fontSize: AppSizes.fontSizeXl,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: AppColors.textColor,
        fontSize: AppSizes.fontSizeMd,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.buttonColor,
      surface: AppColors.darkBlue,
      error: AppColors.error,
      onPrimary: AppColors.textColor,
      onSecondary: AppColors.textColor,
      onSurface: AppColors.textColor,
      onError: AppColors.textColor,
    ).copyWith(error: AppColors.error),
  );
}
