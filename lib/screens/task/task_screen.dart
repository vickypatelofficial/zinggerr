import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/screens/task/task_custom_widget.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, dynamic>> _completedTasks = [
    {
      'id': '1',
      'title': 'Complete project documentation',
      // 'description': 'Write detailed documentation for the new features',
      'deadline': '10 April 2025',
      'completedDate': '27 May 2025',
      'assignBy': 'Chandan Singh',
      'status': 'Completed',
    },
  ];

  final List<Map<String, dynamic>> _pendingTasks = [
    {
      'id': '2',
      'title': 'Implement user authentication',
      'deadline': '07 April 2025',
      'assignBy': 'Chandan Singh',
      'status': 'Pending',
    },
    {
      'id': '3',
      'title': 'Fix navigation bugs',
      'deadline': '15 April 2025',
      'assignBy': 'Rahul Sharma',
      'status': 'Pending',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Tasks',
        showSearchDialog: () {},
        showNotifications: (BuildContext) {},
        notificationCount: 3,
      ),
      body: Column(
        children: [
          // Tab Bar
          PatternBackground(
            elevation: 0,
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.primaryColor,
              labelColor: AppColors.primaryColor,
              // ignore: deprecated_member_use
              unselectedLabelColor: AppColors.textColor.withOpacity(0.6),
              tabs: const [
                Tab(
                  icon: Icon(Icons.check_circle_outline),
                  text: 'Completed',
                ),
                Tab(
                  icon: Icon(Icons.schedule_outlined),
                  text: 'Pending',
                ),
              ],
            ),
          ),
          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Completed Tasks Tab
                CompletedTasksList(
                  tasks: _completedTasks,
                ),
                // Pending Tasks Tab
                PendingTasksList(
                  tasks: _pendingTasks,
                  onComplete: (task) {
                    // Handle task completion logic here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
