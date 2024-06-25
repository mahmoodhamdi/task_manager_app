import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/features/authentication/ui/views/login_view.dart';
import 'package:task_manager_app/features/authentication/ui/views/register_view.dart';
import 'package:task_manager_app/features/home/ui/views/home_view.dart';
import 'package:task_manager_app/features/onboarding/ui/views/onboarding_view.dart';

class Routes {
  static const String onboarding = '/';
  static const String registerView = '/register_view';
  static const String homeView = '/home_view';
  static const String loginView = '/login_view';
  static const String signUpView = '/sign_up_view';
  static const String settingsView = '/settings_view';
  static const String addTaskView = '/add_task_view';
  static const String editTaskView = '/edit_task_view';
  static const String addTaskCategoryView = '/add_task_category_view';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());

      case registerView:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      case loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case homeView:
        // Check if args is of type User (replace User with actual type)
        if (args is User) {
          return MaterialPageRoute(builder: (_) => HomeView(user: args));
        }
        // If args is null or of unexpected type, handle it accordingly
        return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        // Return a default error page for unknown routes
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('${settings.name} not found')),
            appBar: AppBar(title: const Text('Error')),
          ),
        );
    }
  }
}
