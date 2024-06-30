import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_manager_app/core/constants/app_colors.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';
import 'package:task_manager_app/features/calender/ui/views/calender_view.dart';
import 'package:task_manager_app/features/focus/ui/views/focus_view.dart';
import 'package:task_manager_app/features/home/logic/navigation/navigation_cubit.dart';
import 'package:task_manager_app/features/home/ui/widgets/add_note_bottom_sheet.dart';
import 'package:task_manager_app/features/index/ui/views/index_view.dart';
import 'package:task_manager_app/features/profile/ui/views/profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            tooltip: 'Add Task',
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return const AddTaskBottomSheet();
                  });
            },
            backgroundColor: AppColors.primaryColor,
            clipBehavior: Clip.antiAlias,
            shape: const StadiumBorder(),
            child: const Icon(Iconsax.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: _getView(state),
          bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              backgroundColor: AppColors.navBar,
              selectedItemColor: AppColors.whiteWithOpacity,
              unselectedItemColor: AppColors.white.withOpacity(0.98),
              selectedLabelStyle: AppTextThemes.font12WhiteWithOpacityRegular,
              unselectedLabelStyle:
                  AppTextThemes.font12WhiteWithOpacityRegular.copyWith(
                color: AppColors.white.withOpacity(.98),
              ),
              unselectedIconTheme: IconThemeData(
                color: AppColors.white.withOpacity(.98),
              ),
              selectedIconTheme: IconThemeData(
                color: AppColors.whiteWithOpacity,
              ),
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                context.read<NavigationCubit>().navigateTo(index);
              },
              currentIndex: state,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.home),
                  label: 'Home',
                  activeIcon: Icon(Iconsax.home_15),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.calendar_1),
                  label: 'Calender',
                  activeIcon: Icon(Iconsax.calendar_2),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.timer_outlined,
                  ),
                  activeIcon: Icon(Icons.timer_rounded),
                  label: 'Focus',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.user),
                  activeIcon: Icon(Iconsax.profile_2user5),
                  label: 'Profile',
                ),
              ]),
        );
      },
    );
  }

  Widget _getView(int index) {
    switch (index) {
      case 0:
        return const IndexView();
      case 1:
        return const CalenderView();

      case 2:
        return const FocusView();
      case 3:
        return const ProfileView();
      default:
        return const IndexView();
    }
  }
}
