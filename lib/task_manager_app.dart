import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/routes/routes.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key, required this.initialRoute});
  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Task Manager App',
            theme: ThemeData.dark(),
            initialRoute: initialRoute,
            onGenerateRoute: Routes.generateRoute,
          );
        });
  }
}
