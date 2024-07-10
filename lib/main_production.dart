import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/di/service_locator.dart';
import 'package:task_manager_app/core/routes/routes.dart';
import 'package:task_manager_app/task_manager_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  runApp(const TaskManagerApp(
    initialRoute: Routes.onboarding,
  ));
}
// flutter run --release -t lib/main_production.dart --flavor production
// flutter build apk --flavor production -t lib/main_production.dart
