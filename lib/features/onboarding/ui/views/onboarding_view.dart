import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/constants/app_constants.dart';
import 'package:task_manager_app/core/constants/app_strings.dart';
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 56.0.h, horizontal: 24.0.w),
          child: Stack(
            children: [
              Positioned.fill(
                top: 56.0.h,
                 child: OnboardingPageView(
                  pageController: controller,
                ),
              ),
              Positioned(
                left: 0.0.w,
                top: 0.0.h,
                child: TextButtonWidget(
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
              ),
              Positioned(
                left: 0.0.w,
                bottom: 0.0.h,
                child: TextButtonWidget(
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
              ),
              ValueListenableBuilder<int>(
                  valueListenable: pageIndexNotifier,
                  builder: (context, value, child) {
                    return Positioned(
                      bottom: 0.0.h,
                      right: 0.0.w,
                      child: ButtonWidget(
                        text: pageIndexNotifier.value == 2
                            ? AppStrings.getStarted
                            : AppStrings.next,
                        width: pageIndexNotifier.value == 2 ? 151.0.w : null,
                        onTap: () {
                          if (pageIndexNotifier.value != 2) {
                            setState(() {
                              controller.nextPage(
                                duration: duration,
                                curve: Curves.easeInOut,
                              );
                            });
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.registerView,
                            );
                          }
                        },
                      ),
                    );
                  }),
              Positioned(
                bottom: 120.0.h,
                left: 24.0.w,
                child: OnboardingDotIndicator(
                  pageController: controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
