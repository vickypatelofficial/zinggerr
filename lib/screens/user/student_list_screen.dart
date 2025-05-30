import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/screens/dashboard/custom_end_drawer.dart';
import 'package:zinggerr/screens/dashboard/dashboard_custom_widgets.dart';
import 'package:zinggerr/screens/dashboard/todolist_screen.dart';
import 'package:zinggerr/screens/notification/notification_screen.dart';
import 'package:zinggerr/screens/user/userlist_custom_widgets.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';
import 'package:zinggerr/widgets/custom_scaffold.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';
import 'package:zinggerr/widgets/custom_text_field.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data - replace with your actual data
    final student = [
      {
        'name': 'Vicky patel',
        'email': 'vicky@gmail.com',
        'username': 'vicky123',
        'phone': '99999999999',
        'role': 'Student',
        'gender': 'Male',
        'status': true,
        'image': 'https://www.zinggerr.com/asset/images/download.jpg',
      },
      {
        'name': 'Vicky patel',
        'email': 'vicky@gmail.com',
        'username': 'vicky123',
        'phone': '99999999999',
        'role': 'Student',
        'gender': 'Male',
        'status': true,
        'image': 'https://www.zinggerr.com/asset/images/download.jpg',
      },
      {
        'name': 'Vicky patel',
        'email': 'vicky@gmail.com',
        'username': 'vicky123',
        'phone': '99999999999',
        'role': 'Student',
        'gender': 'Male',
        'status': true,
        'image': 'https://www.zinggerr.com/asset/images/download.jpg',
      },
      {
        'name': 'Vicky patel',
        'email': 'vicky@gmail.com',
        'username': 'vicky123',
        'phone': '99999999999',
        'role': 'Student',
        'gender': 'Male',
        'status': true,
        'image': 'https://www.zinggerr.com/asset/images/download.jpg',
      },
      {
        'name': 'Vicky patel',
        'email': 'vicky@gmail.com',
        'username': 'vicky123',
        'phone': '99999999999',
        'role': 'Student',
        'gender': 'Male',
        'status': true,
        'image': 'https://www.zinggerr.com/asset/images/download.jpg',
      },
      // Add more users as needed
    ];

    return StatusBarCustom(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Students List',
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            // Search and Filter Section
            CustomTextFormWidget(
              hintText: 'Search...',
              prefixWidget: const Icon(Icons.search),
              contentpadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Please enter a search term';
                }
                return null;
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: student.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 24),
                        itemBuilder: (context, index) {
                          final user = student[index];
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: student.length,
                            separatorBuilder: (context, index) =>
                                const Divider(height: 24),
                            itemBuilder: (context, index) {
                              final user = student[index];
                              return UserListItem(
                                name: user['name'].toString(),
                                email: user['email'].toString(),
                                username: user['username'] as String,
                                phone: user['phone']! as String,
                                role: user['role'] as String,
                                gender: user['gender'] as String,
                                status: user['status'] as bool,
                                image: user['image'] as String,
                                onEdit: () {},
                                onDelete: () =>
                                    _showDeleteConfirmation(context), onInfo: () {  },
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Are you sure? For Delete',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(
          'This action cannot be undone!',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.primaryColor),
            ),
          ),
          TextButton(
            onPressed: () {
              // Handle delete
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'User deleted successfully',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.white),
                  ),
                  backgroundColor: AppColors.greenLight,
                ),
              );
            },
            child: Text(
              'Delete',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.errorColor),
            ),
          ),
        ],
      ),
    );
  }
}
