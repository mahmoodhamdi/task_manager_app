import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/routes/routes.dart';
import 'package:task_manager_app/core/themes/app_themes.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});
// TaskManagementApp>> task_manager_app.dart
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Manager App',
        theme: AppThemes.darkTheme,
        initialRoute: Routes.onboarding,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
