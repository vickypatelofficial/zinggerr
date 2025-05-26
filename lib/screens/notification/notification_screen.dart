import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      "id": "84b08543-98de-41f0-b420-b95a73f7aa0a",
      "title": "New Course Created",
      "message": "A new course 'test new course' has been created.",
      "time": "1 month ago",
      "isRead": false,
    },
    {
      "id": "94c18544-88de-51f0-c420-c95a73f8bb1b",
      "title": "Assignment Graded",
      "message": "Your assignment has been graded with A+",
      "time": "2 weeks ago",
      "isRead": true,
    },
    {
      "id": "75d29545-78de-61f0-d420-d95a73f9cc2c",
      "title": "New Message",
      "message": "You have received a new message from your instructor",
      "time": "3 days ago",
      "isRead": false,
    },
  ];

   NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.normal, // Reduced from bold
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _markAllAsRead(),
            child: Text(
              'Mark all as read',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.normal, // Reduced weight
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const Divider(height: 24),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return _NotificationItem(
            notification: notification,
            onTap: () => _handleNotificationTap(notification),
          );
        },
      ),
    );
  }

  void _markAllAsRead() {
    // Implementation
  }

  void _handleNotificationTap(Map<String, dynamic> notification) {
    // Implementation
  }
}

class _NotificationItem extends StatelessWidget {
  final Map<String, dynamic> notification;
  final VoidCallback onTap;

  const _NotificationItem({
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.notifications_none,
                color: AppColors.primaryColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          notification['title'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500, // Medium weight
                          ),
                        ),
                      ),
                      Text(
                        notification['time'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification['message'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  if (!notification['isRead'])
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Unread',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}