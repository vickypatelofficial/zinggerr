import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';
import 'package:zinggerr/widgets/custom_buton.dart';
import 'package:zinggerr/widgets/custom_scaffold.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';
import 'package:zinggerr/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  // Background color state
  Color backgroundColor = const Color(0xFFd4e7f9);
  Color backgroundPickerColor = const Color(0xFFd4e7f9);
  void changeBackgroundColor(Color color) {
    setState(() {
      backgroundPickerColor = color;
    });
  }

  // Text color state
  Color textColor = const Color(0xFF000000);
  Color textPickerColor = const Color(0xFF000000);
  void changeTextColor(Color color) {
    setState(() {
      textPickerColor = color;
    });
  }

  // Date and time states
  DateTime? startDate;
  TimeOfDay? startTime;
  DateTime? endDate;
  TimeOfDay? endTime;
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatusBarCustom(
      child: CustomScaffold(
        appBar: const CustomAppBar(
          title: 'Create Event',
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        // Title Field
                        Text(
                          'Title *',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        CustomTextFormWidget(
                          hintText: 'Enter Title..',
                          validator: (value) => validateSimple(value ?? ''),
                        ),
                        const SizedBox(height: 16),

                        // Color Pickers Row
                        Row(
                          children: [
                            // Background Color Picker
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Background Color *',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            titlePadding:
                                                const EdgeInsets.all(0.0),
                                            contentPadding:
                                                const EdgeInsets.all(0.0),
                                            content: SingleChildScrollView(
                                              child: ColorPicker(
                                                pickerColor:
                                                    backgroundPickerColor,
                                                onColorChanged:
                                                    changeBackgroundColor,
                                                colorPickerWidth: 300.0,
                                                pickerAreaHeightPercent: 0.7,
                                                enableAlpha: true,
                                                displayThumbColor: true,
                                                showLabel: true,
                                                paletteType: PaletteType.hsv,
                                                pickerAreaBorderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(2.0),
                                                  topRight:
                                                      Radius.circular(2.0),
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Choose'),
                                                onPressed: () {
                                                  setState(() {
                                                    backgroundColor =
                                                        backgroundPickerColor;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),

                            // Text Color Picker
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Text Color *',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            titlePadding:
                                                const EdgeInsets.all(0.0),
                                            contentPadding:
                                                const EdgeInsets.all(0.0),
                                            content: SingleChildScrollView(
                                              child: ColorPicker(
                                                pickerColor: textPickerColor,
                                                onColorChanged: changeTextColor,
                                                colorPickerWidth: 300.0,
                                                pickerAreaHeightPercent: 0.7,
                                                enableAlpha: true,
                                                displayThumbColor: true,
                                                showLabel: true,
                                                paletteType: PaletteType.hsv,
                                                pickerAreaBorderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(2.0),
                                                  topRight:
                                                      Radius.circular(2.0),
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Choose'),
                                                onPressed: () {
                                                  setState(() {
                                                    textColor = textPickerColor;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      decoration: BoxDecoration(
                                        color: textColor,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Start Date & Time
                        Text(
                          'Start Date & Time *',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () async {
                            // Pick date
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: startDate ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              // Pick time
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: startTime ?? TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  startDate = pickedDate;
                                  startTime = pickedTime;
                                  startDateController.text =
                                      '${pickedDate.day}/${pickedDate.month}/${pickedDate.year} ${pickedTime.hour}:${pickedTime.minute}';
                                });
                              }
                            }
                          },
                          child: AbsorbPointer(
                            child: CustomTextFormWidget(
                              hintText: 'dd/mm/yyyy --:--',
                              controller: startDateController,
                              validator: (value) => validateSimple(value ?? ''),
                              keyboardType: TextInputType.datetime,
                              suffixWidget: IconButton(
                                icon: const Icon(Icons.calendar_today,
                                    color: AppColors.primaryColor),
                                onPressed:
                                    null, // Disabled, handled by GestureDetector
                              ),
                              readOnly: true,
                              // Disable direct editing
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // End Date & Time
                        Text(
                          'End Date & Time *',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () async {
                            // Pick end date
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: endDate ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              // Pick end time
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: endTime ?? TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  endDate = pickedDate;
                                  endTime = pickedTime;
                                  endDateController.text =
                                      '${pickedDate.day}/${pickedDate.month}/${pickedDate.year} ${pickedTime.hour}:${pickedTime.minute}';
                                });
                              }
                            }
                          },
                          child: AbsorbPointer(
                            child: CustomTextFormWidget(
                              hintText: 'dd/mm/yyyy --:--',
                              controller: endDateController,
                              validator: (value) => validateSimple(value ?? ''),
                              keyboardType: TextInputType.datetime,
                              suffixWidget: IconButton(
                                icon: const Icon(Icons.calendar_today,
                                    color: AppColors.primaryColor),
                                onPressed:
                                    null, // Disabled, handled by GestureDetector
                              ),
                              readOnly: true, // Disable direct editing
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Description
                        Text(
                          'Description *',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                          ),
                          child: const TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              border: InputBorder.none,
                              hintText: 'Enter description here...',
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Submit Button
                        Center(
                          child: CustomButton(
                            text: 'Submit',
                            ontap: () {
                              // Handle form submission
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
