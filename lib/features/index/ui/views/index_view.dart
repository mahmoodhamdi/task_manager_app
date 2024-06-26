import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_manager_app/core/constants/app_colors.dart';
import 'package:task_manager_app/core/constants/app_images.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';

class IndexView extends StatelessWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 24.0.w,vertical: 30.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.sort,
                        color: AppColors.whiteWithOpacity),
                  ),
                 
                  Text(
                    'Index',
                    style: AppTextThemes.font20WhiteRegularWithStyle,
                  ),
                 
                    CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 20.r,
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.noTasks,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'What do you want to do today?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Tap + to add your tasks',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
