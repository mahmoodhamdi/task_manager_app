import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager_app/core/constants/app_images.dart';
import 'package:task_manager_app/core/constants/app_strings.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  width: 277.w,
                  height: 277.h,
                  AppImages.onboardingImagesList[index]),
              verticalSpace(51.0),
              Text(
                AppStrings.onBoardingTitlesList[index],
                style: AppTextThemes.font32WhiteBold,
              ),
              verticalSpace(42.0),
              Text(
                maxLines: 2,
                AppStrings.onBoardingSubTitlesList[index],
                style: AppTextThemes.font16WhiteRegular,
              ),
              verticalSpace(8.0),
              Text(
                AppStrings.onBoardingSubTitlesList2[index],
                style: AppTextThemes.font16WhiteRegular,
              ),
            ],
          );
        },
        itemCount: 3);
  }
}
