import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_manager_app/core/constants/app_colors.dart';

class OnboardingDotIndicator extends StatelessWidget {
  const OnboardingDotIndicator({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      axisDirection: Axis.horizontal,
      onDotClicked: (index) {
        pageController.jumpToPage(index);
      },
      effect: ExpandingDotsEffect(
        dotHeight: 4.0.h,
        dotWidth: 26.28.w,
        activeDotColor: AppColors.white,
      ),
    );
  }
}
