import 'package:flutter/material.dart';
import 'package:task_manager_app/features/home/ui/widgets/add_task_form.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: false,
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const SingleChildScrollView(
          child: AddTaskForm(),
        ),
      ),
    );
  }
}
