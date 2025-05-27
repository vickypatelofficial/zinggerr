import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/screens/notification/notification_custom_widgets.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "New Course Created",
      "message": "A new course 'test new course' has been created.",
      "time": "1 month ago",
      "icon": Icons.notifications,
      "color": Colors.lightGreen,
    },
    {
      "title": "testing",
      "message": "testing",
      "time": "1 month ago",
      "icon": Icons.notifications,
      "color": Colors.lightGreen,
    },
    {
      "title": "Long Event",
      "message": "testing long events",
      "time": "1 month ago",
      "icon": Icons.notifications,
      "color": Colors.lightGreen,
    },
  ];

  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Mark all as read',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
      body: PatternBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header

              const SizedBox(height: 16),

              // Notifications List
              ...notifications.map((notification) {
                return Column(
                  children: [
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: notification["color"].withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          notification["icon"],
                          color: notification["color"],
                        ),
                      ),
                      title: Text(
                        notification["title"],
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification["message"],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            notification["time"],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color:
                                        AppColors.textColor.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      contentPadding: EdgeInsets.zero,
                      onTap: () {}, // Optional: add your tap logic here
                    ),
                    const Divider(height: 16),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
