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
      'title': 'Complete my task which you have assign', 
      'deadline': '10 April 2025',
      'completedDate': '27 May 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Completed',
    },
    { 
      'title': 'Complete my task which you have assign', 
      'deadline': '10 April 2025',
      'completedDate': '27 May 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Completed',
    },
    { 
      'title': 'Complete my task which you have assign', 
      'deadline': '10 April 2025',
      'completedDate': '27 May 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Completed',
    },
    { 
      'title': 'Complete my task which you have assign', 
      'deadline': '10 April 2025',
      'completedDate': '27 May 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Completed',
    },
    { 
      'title': 'Complete my task which you have assign', 
      'deadline': '10 April 2025',
      'completedDate': '27 May 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Completed',
    },
    { 
      'title': 'Complete my task which you have assign', 
      'deadline': '10 April 2025',
      'completedDate': '27 May 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Completed',
    },
  ];

  final List<Map<String, dynamic>> _pendingTasks = [
    { 
      'title': 'Submit remaining assignment of all subjects',
      'deadline': '07 April 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Pending',
    },
    { 
      'title': 'Submit remaining assignment of all subjects',
      'deadline': '07 April 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Pending',
    },
    { 
      'title': 'Submit remaining assignment of all subjects',
      'deadline': '07 April 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Pending',
    },
    { 
      'title': 'Submit remaining assignment of all subjects',
      'deadline': '07 April 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Pending',
    },
    { 
      'title': 'Submit remaining assignment of all subjects',
      'deadline': '07 April 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Pending',
    },
    { 
      'title': 'Submit remaining assignment of all subjects',
      'deadline': '07 April 2025',
      'assignBy': 'Vicky Patel',
      'status': 'Pending',
    },
    { 
      'title': 'Submit remaining assignment of all subjects',
      'deadline': '07 April 2025',
      'assignBy': 'Vicky Patel',
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
                CompletedTasksList(
                  tasks: _completedTasks,
                ),
                PendingTasksList(
                  tasks: _pendingTasks,
                  onComplete: (task) {
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
