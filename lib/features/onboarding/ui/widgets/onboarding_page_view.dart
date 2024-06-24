import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager_app/core/constants/app_images.dart';
import 'package:task_manager_app/core/constants/app_strings.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';
import 'package:task_manager_app/core/utils/utils.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.onboardingImagesList[index],
              width: Utils.screenWidth(context) * 0.5,
              height: Utils.screenHeight(context) * 0.3,
            ),
            verticalSpace(16.0.h),
            Text(
              AppStrings.onBoardingTitlesList[index],
              style: AppTextThemes.font28WhiteBold,
              maxLines: 1,
            ),
            verticalSpace(16.0.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.onBoardingSubTitlesList[index],
                  style: AppTextThemes.font14WhiteRegular,
                  maxLines: 1,
                ),
                verticalSpace(8.0.h),
                Text(
                  AppStrings.onBoardingSubTitlesList2[index],
                  style: AppTextThemes.font14WhiteRegular,
                  maxLines: 1,
                ),
              ],
            ),
          ],
        );
      },
      itemCount: 3,
    );
  }
}
