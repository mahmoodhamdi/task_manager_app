import 'package:flutter/material.dart';
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  width: Utils.screenWidth(context) * .5,
                  height: Utils.screenHeight(context) * .3,
                  AppImages.onboardingImagesList[index]),
              Text(
                maxLines: 1,
                AppStrings.onBoardingTitlesList[index],
                style: AppTextThemes.font28WhiteBold,
              ),
              verticalSpace(16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    maxLines: 1,
                    AppStrings.onBoardingSubTitlesList[index],
                    style: AppTextThemes.font14WhiteRegular,
                  ),
                  verticalSpace(8.0),
                  Text(
                    maxLines: 1,
                    AppStrings.onBoardingSubTitlesList2[index],
                    style: AppTextThemes.font14WhiteRegular,
                  ),
                ],
              ),
            ],
          );
        },
        itemCount: 3);
  }
}
