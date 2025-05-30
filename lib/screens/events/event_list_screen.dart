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

class EventsListScreen extends StatelessWidget {
  const EventsListScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    final events = [
      {
        'id': '',
        'title': 'Testing Event',
        'startDate': DateTime(2025, 4, 8, 12, 0),
        'endDate': DateTime(2025, 4, 9, 12, 0),
        'status': 'Active',
      },
      {
        'id': '',
        'title': 'Testing Event 2',
        'startDate': DateTime(2025, 4, 10, 9, 0),
        'endDate': DateTime(2025, 4, 10, 17, 0),
        'status': 'Inactive',
      },
      {
        'id': '',
        'title': 'Testing Event 3',
        'startDate': DateTime(2025, 4, 12, 10, 0),
        'endDate': DateTime(2025, 4, 12, 15, 0),
        'status': 'Active',
      },
      {
        'id': '',
        'title': 'Testing Event 4',
        'startDate': DateTime(2025, 4, 15, 8, 0),
        'endDate': DateTime(2025, 4, 15, 20, 0),
        'status': 'Inactive',
      },
    ];

    DateTime? selectedDate;

    return StatusBarCustom(
      child: CustomScaffold(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Events List',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          StatefulBuilder(
                            builder: (context, setState) {
                              return GestureDetector(
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate ?? DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      selectedDate = picked;
                                    });
                                  }
                                },
                                child: Container(
                                  width: 200,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 14),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          selectedDate != null
                                              ? DateFormat('dd MMM yyyy')
                                                  .format(selectedDate!)
                                              : 'Select Date',
                                          style: TextStyle(
                                            color: selectedDate != null
                                                ? Colors.black
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                      const Icon(Icons.calendar_today,
                                          size: 20,
                                          color: AppColors.primaryColor),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Events List
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: events.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return PatternBackground(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 12, bottom: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [ 
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          event['title'] as String,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: event['status'] == 'Active'
                                              ? AppColors.greenLight
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          event['status'] as String,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                color: AppColors.white,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  // Dates row
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today,
                                          size: 16,
                                          color: AppColors.primaryColor),
                                      const SizedBox(width: 8),
                                      Text(
                                        'From: ${DateFormat('dd MMM yyyy, hh:mm a').format(event['startDate'] as DateTime)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today,
                                          size: 16,
                                          color: AppColors.primaryColor),
                                      const SizedBox(width: 8),
                                      Text(
                                        'To: ${DateFormat('dd MMM yyyy, hh:mm a').format(event['endDate'] as DateTime)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ), 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor
                                              .withOpacity(0.1),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.primaryColor
                                                  .withOpacity(0.08),
                                              blurRadius: 4,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.edit,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.1),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.red.withOpacity(0.08),
                                              blurRadius: 4,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}