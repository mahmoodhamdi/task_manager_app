import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/constants/app_constants.dart';
import 'package:task_manager_app/core/constants/app_strings.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/routes/routes.dart';
import 'package:task_manager_app/core/widgets/button_widget.dart';
import 'package:task_manager_app/core/widgets/text_button_widget.dart';
import 'package:task_manager_app/features/onboarding/ui/widgets/on_boarding_dot_navigation.dart';
import 'package:task_manager_app/features/onboarding/ui/widgets/onboarding_page_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController controller;
  late ValueNotifier<int> pageIndexNotifier;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    pageIndexNotifier =
        ValueNotifier<int>(0); // Initialize with initial page index
    controller.addListener(() {
      pageIndexNotifier.value = controller.page!.round();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    pageIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60.0.h, horizontal: 24.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              onPressed: () {
                setState(() {
                  controller.animateToPage(
                    2,
                    duration: duration,
                    curve: Curves.easeInOut,
                  );
                });
              },
            ),
            Expanded(
              child: OnboardingPageView(
                pageController: controller,
              ),
            ),
            Column(
              children: [
                verticalSpace(50.0),
                OnboardingDotIndicator(
                  pageController: controller,
                ),
                verticalSpace(50.0),
                ValueListenableBuilder<int>(
                  valueListenable: pageIndexNotifier,
                  builder: (context, pageIndex, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButtonWidget(
                          text: AppStrings.back,
                          onPressed: () {
                            setState(() {
                              controller.previousPage(
                                duration: duration,
                                curve: Curves.easeInOut,
                              );
                            });
                          },
                        ),
                        ButtonWidget(
                          text: pageIndex == 2
                              ? AppStrings.getStarted
                              : AppStrings.next,
                          width: pageIndex == 2 ? 151.0.w : null,
                          onTap: () {
                            if (pageIndex != 2) {
                              setState(() {
                                controller.nextPage(
                                  duration: duration,
                                  curve: Curves.easeInOut,
                                );
                              });
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, Routes.welcomeView);
                            }
                          },
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
