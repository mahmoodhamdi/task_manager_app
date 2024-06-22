import 'package:flutter/material.dart';
import 'package:task_manager_app/features/onboarding/ui/views/onboarding_view.dart';
import 'package:task_manager_app/features/onboarding/ui/views/welcome_view.dart';

class Routes {
  static const String onboarding = '/';
  static const String welcomeView = '/welcome_view';
  static const String homeView = '/home_view';
  static const String loginView = '/login_view';
  static const String signUpView = '/sign_up_view';
  static const String settingsView = '/settings_view';
  static const String addTaskView = '/add_task_view';
  static const String editTaskView = '/edit_task_view';
  static const String addTaskCategoryView = '/add_task_category_view';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // this arguments is for passing data from one screen to another
    // final arguments = settings.arguments;

    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());

      case welcomeView:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      default:
        // error page
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('${settings.name} not found')),
                  appBar: AppBar(title: const Text('Error')),
                ));
    }
  }
}
