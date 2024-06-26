import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/databases/database_helper.dart';
import 'package:task_manager_app/core/di/service_locator.dart';
import 'package:task_manager_app/core/routes/routes.dart';
import 'package:task_manager_app/task_manager_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  final dbHelper = getIt<DatabaseHelper>();
  final onboardingShown =
      await dbHelper.getSetting('onboardingShown') == 'true';
  final isLoggedIn = await dbHelper.getSetting('isLoggedIn') == 'true';
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  runApp(TaskManagerApp(
    initialRoute: isLoggedIn == true
        ? Routes.homeView
        : onboardingShown == true
            ? Routes.loginView
            : Routes.onboarding,
  ));
}

// flutter run --release -t lib/main_development.dart --flavor development
// flutter build apk --flavor development -t lib/main_development.dart 