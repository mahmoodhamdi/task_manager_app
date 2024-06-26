import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_manager_app/core/constants/app_colors.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';
import 'package:task_manager_app/core/utils/validation.dart';
import 'package:task_manager_app/core/widgets/app_text_form_field.dart';
import 'package:task_manager_app/features/calender/ui/views/calendar_view.dart';
import 'package:task_manager_app/features/focus/ui/views/focus_view.dart';
import 'package:task_manager_app/features/home/logic/cubits/navigation_cubit/navigation_cubit_cubit.dart';
import 'package:task_manager_app/features/index/ui/views/index_view.dart';
import 'package:task_manager_app/features/profile/ui/views/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _getView(state),
          bottomNavigationBar: ConvexAppBar(
            elevation: 0,
            style: TabStyle.fixedCircle,
            height: 60,
            backgroundColor: const Color(0xFF363636),
            activeColor: Colors.white.withOpacity(0.87),
            color: Colors.white.withOpacity(0.98),
            items: const [
              TabItem(
                  icon: Iconsax.home,
                  activeIcon: Iconsax.home_15,
                  title: 'Index',
                  fontFamily: "Lato"),
              TabItem(
                  icon: Iconsax.calendar_1,
                  activeIcon: Iconsax.calendar_2,
                  title: 'Calendar',
                  fontFamily: "Lato"),
              TabItem(icon: Iconsax.add, title: ''),
              TabItem(
                  icon: Icons.timer_outlined,
                  activeIcon: Icons.timer_rounded,
                  title: 'Focus',
                  fontFamily: "Lato"),
              TabItem(
                  icon: Iconsax.profile_2user4,
                  activeIcon: Iconsax.profile_2user5,
                  title: 'Profile',
                  fontFamily: "Lato"),
            ],
            initialActiveIndex: state,
            onTap: (int index) {
              if (index != 2) {
                context.read<NavigationCubit>().navigateTo(index);
              } else {
                //bottomSheet

                _showAddTaskBottomSheet(context);
              }
            },
          ),
        );
      },
    );
  }

  Widget _getView(int index) {
    switch (index) {
      case 0:
        return const IndexView();
      case 1:
        return const CalendarView();
      case 2:
        // This will not be called due to the condition in onTap
        return const IndexView();
      case 3:
        return const FocusView();
      case 4:
        return const ProfileView();
      default:
        return const IndexView();
    }
  }
}

void _showAddTaskBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              verticalSpace(8),
              Text(
                'Add Task',
                style: AppTextThemes.font20WhiteRegularWithStyle,
              ),
              verticalSpace(16),
              AppTextFormField(
                hintText: 'Enter task name',
                validator: (value) {
                  return AppValidator.validateEmpty(value,
                      fieldName: "Task Name");
                },
              ),
              verticalSpace(16),
              Text(
                "Description",
                style: AppTextThemes.font18lightGreyRegular,
              ),
              verticalSpace(35),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.timer_14,
                        color: AppColors.whiteWithOpacity),
                  ),
                  horizontalSpace(32),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.tag, color: AppColors.whiteWithOpacity),
                  ),
                  horizontalSpace(32),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.flag, color: AppColors.whiteWithOpacity),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.send_14,
                        color: AppColors.primaryColor),
                  ),
                  verticalSpace(8),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
