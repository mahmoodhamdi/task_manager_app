import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_manager_app/core/constants/app_colors.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';
import 'package:task_manager_app/core/themes/app_text_themes.dart';
import 'package:task_manager_app/core/validators/validation.dart';
import 'package:task_manager_app/core/widgets/app_text_form_field.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            verticalSpace(8),
            Text(
              'Add Task',
              style: AppTextThemes.font20WhiteRegularWithStyle,
            ),
            verticalSpace(16),
            AppTextFormField(
              hintText: 'Enter task name',
              validator: (value) {
                return AppValidator.validateEmpty(value,
                    fieldName: "Task Name");
              },
            ),
            verticalSpace(16),
            Text(
              "Description",
              style: AppTextThemes.font18lightGreyRegular,
            ),
            verticalSpace(35),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              lastDate: DateTime(2050, 12, 31),
                              firstDate: DateTime.now(),
                            );
                          },
                          icon: Icon(Iconsax.calendar_1,
                              color: AppColors.whiteWithOpacity),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                          },
                          icon: Icon(Iconsax.timer_1,
                              color: AppColors.whiteWithOpacity),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Iconsax.tag,
                              color: AppColors.whiteWithOpacity),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Iconsax.flag,
                              color: AppColors.whiteWithOpacity),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(flex: 3, child: SizedBox()),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.send_14,
                        color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
