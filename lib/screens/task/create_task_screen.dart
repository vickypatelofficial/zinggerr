import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';
import 'package:zinggerr/widgets/custom_buton.dart';
import 'package:zinggerr/widgets/custom_scaffold.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';
import 'package:zinggerr/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/screens/dashboard/custom_end_drawer.dart';
import 'package:zinggerr/screens/dashboard/dashboard_custom_widgets.dart';
import 'package:zinggerr/screens/dashboard/todolist_screen.dart';
import 'package:zinggerr/screens/notification/notification_screen.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusBarCustom(
      child: CustomScaffold(
        appBar: const CustomAppBar(
          title: 'Create Task',
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Field
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                CustomTextFormWidget(
                  hintText: 'Enter Task Title..',
                  validator: (value) =>
                      validateSimple(value ?? '', fieldName: 'Title'),
                ),
                const SizedBox(height: 16),
                
                // Deadline Field
                Text(
                  'Deadline',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                CustomTextFormWidget(
                  hintText: 'dd/mm/yyyy',
                  validator: (value) =>
                      validateSimple(value ?? '', fieldName: 'Deadline'),
                  readOnly: true,
                  suffixWidget: IconButton(
                    icon: const Icon(Icons.calendar_today,
                        color: AppColors.primaryColor),
                    onPressed:
                        null, // Disabled, handled by GestureDetector
                  ),
                  ontap: () {
                    // Show date picker
                    _selectDate(context);
                  },
                ),
                const SizedBox(height: 16),
                
                // Description Field
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                CustomTextFormWidget(
                  hintText: 'Enter description here...',
                  maxLines: 5,
                  validator: (value) => validateSimple(value ?? '',
                      fieldName: 'Description'),
                ),
                const SizedBox(height: 16),
                
                // Status Radio Buttons
                Text(
                  'Status',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: 1, // Default to active
                      onChanged: (value) {},
                      activeColor: AppColors.primaryColor,
                    ),
                    Text(
                      'Active',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 16),
                    Radio(
                      value: 0,
                      groupValue: 1, // Default to active
                      onChanged: (value) {},
                      activeColor: AppColors.primaryColor,
                    ),
                    Text(
                      'Inactive',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Assign To Section
                Text(
                  'Assign To:',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 15),
                Builder(
                  builder: (context) {
                    Color color = AppColors.primaryColor.withOpacity(0.5);
                    return GestureDetector(
                      onTap: () {
                      // Show user selection modal
                      },
                      child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                      decoration: BoxDecoration(
                        border: Border.all(color: color, width: 1.5),
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.primaryColor.withOpacity(0.07),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        Icon(Icons.person_add_alt_1, color:color),
                        const SizedBox(width: 10),
                        Text(
                          'Select Users',
                          style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            // ignore: deprecated_member_use
                            ?.copyWith(color: AppColors.primaryColor.withOpacity(.7), fontWeight: FontWeight.w600),
                        ),
                        ],
                      ),
                      ),
                    );
                  }
                ),
                
                // Selected User Chip
                const SizedBox(height: 8),
                const SizedBox(height: 32),
                
                // Submit Button
                Center(
                  child: CustomButton(
                    text: 'Submit',
                    ontap: () {
                      // Submit form
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      // Update selected date
    }
  }
}
