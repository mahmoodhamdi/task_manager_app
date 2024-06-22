import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  // Padding and margin sizes
  static double xs = 4.0.w;
  static double sm = 8.0.w;
  static double md = 16.0.w;
  static double lg = 24.0.w;
  static double xl = 32.0.w;

  // Icon sizes
  static double iconXs = 12.0.w;
  static double iconSm = 16.0.w;
  static double iconMd = 24.0.w;
  static double iconLg = 32.0.w;

  // Font sizes
  static double fontSizeSm = 14.0.sp;
  static double fontSizeMd = 16.0.sp;
  static double fontSizeLg = 18.0.sp;
  static double fontSizeXl = 20.0.sp;
  static double fontSizeXxl = 24.0.sp;
  static double fontSizeXxxl = 32.0.sp;

  // Button sizes
  static double buttonHeight = 18.0.h;
  static double buttonRadius = 12.0.r;
  static double buttonWidth = 120.0.w;
  static double buttonElevation = 4.0.h;

  // AppBar height
  static double appBarHeight = 56.0.h;

  // Image sizes
  static double imageThumbSize = 80.0.w;

  // Default spacing between sections
  static double defaultSpace = 24.0.w;
  static double spaceBtwItems = 16.0.w;
  static double spaceBtwSections = 32.0.w;

  // Border radius
  static double borderRadiusSm = 4.0.r;
  static double borderRadiusMd = 8.0.r;
  static double borderRadiusLg = 12.0.r;

  // Divider height
  static double dividerHeight = 1.0.h;

  // Product item dimensions
  static double productImageSize = 120.0.w;
  static double productImageRadius = 16.0.r;
  static double productItemHeight = 160.0.h;

  // Input field
  static double inputFieldRadius = 12.0.r;
  static double spaceBtwInputFields = 16.0.w;

  // Card sizes
  static double cardRadiusLg = 16.0.r;
  static double cardRadiusMd = 12.0.r;
  static double cardRadiusSm = 10.0.r;
  static double cardRadiusXs = 6.0.r;
  static double cardElevation = 2.0.h;

  // Image carousel height
  static double imageCarouselHeight = 200.0.h;

  // Loading indicator size
  static double loadingIndicatorSize = 36.0.w;

  // Padding with AppBarHeight
  static EdgeInsets paddingWithAppBarHeight = EdgeInsets.only(
    top: appBarHeight,
    left: defaultSpace,
    right: defaultSpace,
    bottom: defaultSpace,
  );

  // Grid view spacing
  static double gridViewSpacing = 16.0.w;
}
