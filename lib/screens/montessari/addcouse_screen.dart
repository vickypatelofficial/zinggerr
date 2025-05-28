import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';
import 'package:zinggerr/widgets/custom_buton.dart';
import 'package:zinggerr/widgets/custom_scaffold.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';
import 'package:zinggerr/widgets/custom_text_field.dart';

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define some dummy data for dropdowns, as dynamic filtering
    // would typically require a StatefulWidget or state management.
    final List<String> ageGroups = [
      'Montessori (0-3 years)',
      'Casa Dei Bambini (3-6 years)',
      'Other',
    ];

    final List<String> montessoriAreas = [
      'Nido (2-14 Months)',
      'Infant (14 Months- 3 Years)',
    ];

    // Controllers for text input fields
    final TextEditingController courseFullNameController =
        TextEditingController();
    final TextEditingController courseShortNameController =
        TextEditingController();
    final TextEditingController courseIdNumberController =
        TextEditingController();
    final TextEditingController courseSummaryController =
        TextEditingController();

    // Initial selected values for dropdowns (can be null or a default value)
    String? selectedAgeGroup;
    String? selectedMontessoriArea;

    // Add this for image selection
    File? _selectedImage;

    // Add this method for picking images
    Future<void> _pickImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        _selectedImage = File(image.path);
      }
    }

    return StatusBarCustom(
      statusBarColor: AppColors.primaryColor,
      statusBarBrightness: Brightness.light,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Add New Course',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: PatternBackground(
            borderRadius: BorderRadius.circular(12.0),
            elevation: 4.0,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.grey, width: 1.0),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      // General Tab
                      Row(
                        children: [
                          const Icon(Icons.account_circle,
                              size: 20.0, color: AppColors.primaryColor),
                          const SizedBox(width: 8.0),
                          Text(
                            'General',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                      // Course format tab (hidden in original HTML, so not actively styled here)
                      // You would typically use a TabBar and TabBarView for full tab functionality
                    ],
                  ),
                ),
                // Card Body - Tab Content
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Form fields
                      // Course Full Name
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CustomTextFormWidget(
                          controller: courseFullNameController,
                          hintText: 'Enter Course Full Name',
                          title: 'Course Full Name',
                          validator: (value) => validateSimple(value!,
                              fieldName: 'Course Full Name'),
                          suffixWidget: Text(
                            ' *',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.errorColor),
                          ),
                        ),
                      ),

                      // Course Short Name
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CustomTextFormWidget(
                          controller: courseShortNameController,
                          hintText: 'Enter Course Short Name',
                          title: 'Course Short Name',
                          validator: (value) => validateSimple(value!,
                              fieldName: 'Course Short Name'),
                          onChanged: (value) {
                            // Mimic the JS behavior to remove spaces
                            courseShortNameController.text =
                                value?.replaceAll(' ', '') ?? '';
                            courseShortNameController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset:
                                      courseShortNameController.text.length),
                            );
                          },
                          suffixWidget: Text(
                            ' *',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.errorColor),
                          ),
                        ),
                      ),

                      // Select Age-Group
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Select Montessori Age Group',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text(
                                  ' *',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.errorColor),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            DropdownButtonFormField<String>(
                              value: selectedAgeGroup, // Will be null initially
                              decoration: InputDecoration(
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w300),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                                filled: true,
                                fillColor: AppColors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                              ),
                              items: ageGroups.map((String group) {
                                return DropdownMenuItem<String>(
                                  value: group,
                                  child: Text(group,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                // In a StatelessWidget, state cannot be updated directly.
                                // For dynamic updates (like filtering the next dropdown),
                                // this screen would need to be a StatefulWidget.
                                // print('Selected Age Group: $newValue');
                              },
                              validator: (value) => validateSimple(value!,
                                  fieldName: 'Age Group'),
                            ),
                          ],
                        ),
                      ),

                      // Select Montessori Area
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Select Montessori Area',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text(
                                  ' *',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.errorColor),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            DropdownButtonFormField<String>(
                              value:
                                  selectedMontessoriArea, // Will be null initially
                              decoration: InputDecoration(
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w300),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                                filled: true,
                                fillColor: AppColors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                              ),
                              items: montessoriAreas.map((String area) {
                                return DropdownMenuItem<String>(
                                  value: area,
                                  child: Text(area,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                // print('Selected Montessori Area: $newValue');
                              },
                              validator: (value) => validateSimple(value!,
                                  fieldName: 'Montessori Area'),
                            ),
                          ],
                        ),
                      ),

                      // Course ID Number
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CustomTextFormWidget(
                          controller: courseIdNumberController,
                          keyboardType: TextInputType.number,
                          hintText: 'Enter Course ID Number',
                          title: 'Course ID Number',
                          maxLength: 10, // Example max length for ID
                          validator: (value) => null, // Not required in HTML
                        ),
                      ),

                      // Course Summary
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Course Summary',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text(
                                  ' *',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.errorColor),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Course Image Upload',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Text(
                                        ' *',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: AppColors.errorColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  GestureDetector(
                                    onTap: () async {
                                      final ImagePicker picker = ImagePicker();
                                      final XFile? image =
                                          await picker.pickImage(
                                              source: ImageSource.gallery);

                                      if (image != null) {
                                        _selectedImage = File(image.path);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Selected image: ${image.name}')),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content:
                                                  Text('No image selected.')),
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 24.0, horizontal: 16.0),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            color: AppColors.grey, width: 1.0),
                                      ),
                                      child: _selectedImage != null
                                          ? Image.file(
                                              _selectedImage!,
                                              height: 100,
                                              fit: BoxFit.contain,
                                            )
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.cloud_upload,
                                                  size: 48.0,
                                                  color: AppColors.primaryColor,
                                                ),
                                                const SizedBox(height: 8.0),
                                                Text(
                                                  'Click to upload file here',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                          color: AppColors
                                                              .textColor
                                                              .withOpacity(
                                                                  0.7)),
                                                ),
                                                // Display selected file name if available
                                                if (_selectedImage != null)
                                                  Text(
                                                    _selectedImage!.path
                                                        .split('/')
                                                        .last,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                            color: AppColors
                                                                .textColor),
                                                  ),
                                              ],
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            CustomTextFormWidget(
                              controller: courseSummaryController,
                              maxLines: 5, // Simulates a larger textarea
                              hintText: 'Enter course summary...',
                              validator: (value) => validateSimple(value!,
                                  fieldName: 'Course Summary'),
                            ),
                            // Note: The original HTML had a complex Summernote editor.
                            // This is represented by a simple multi-line TextFormField.
                            // For a full rich text editor, consider using a package like `flutter_quill`.
                          ],
                        ),
                      ),

                      // Save Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          text: 'Save Course',
                          ontap: () {
                            // Implement form submission logic here.
                            // In a real app, you would validate the form
                            // and send data to a backend.
                            print(
                                'Course Full Name: ${courseFullNameController.text}');
                            print(
                                'Course Short Name: ${courseShortNameController.text}');
                            print(
                                'Course ID Number: ${courseIdNumberController.text}');
                            print(
                                'Course Summary: ${courseSummaryController.text}');
                            print('Selected Age Group: $selectedAgeGroup');
                            print(
                                'Selected Montessori Area: $selectedMontessoriArea');
                            // Example: Show a snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Save button pressed!')),
                            );
                          },
                          width:
                              null, // Let CustomButton manage its default width
                          height: 50, // Example height
                          borderRadius: 8.0, // Match card's border radius
                          color: AppColors.primaryColor,
                          textAppTextStyles: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
