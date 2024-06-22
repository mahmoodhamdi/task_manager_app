import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/di/service_locator.dart';
import 'package:task_manager_app/task_manager_app.dart';

void main() async {
  setupServiceLocator();
  await ScreenUtil.ensureScreenSize();
  runApp(const TaskManagerApp());
}

// flutter run --release -t lib/main_development.dart --flavor development
// flutter build apk --flavor development -t lib/main_development.dart 