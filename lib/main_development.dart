import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/di/service_locator.dart';
import 'package:task_manager_app/task_manager_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await ScreenUtil.ensureScreenSize();
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return const TaskManagerApp();
      }));
}

// flutter run --release -t lib/main_development.dart --flavor development
// flutter build apk --flavor development -t lib/main_development.dart 