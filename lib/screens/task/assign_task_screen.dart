import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/screens/task/task_custom_widget.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';
import 'package:zinggerr/widgets/custom_scaffold.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';


class AssignTasksScreen extends StatelessWidget {
  AssignTasksScreen({super.key});

  final completedTasks = [
    {
      'id': '038df561-df4d-45b2-b253-f986d5cbb25f',
      'task': 'test',
      'deadline': '10 April 2025',
      'completedDate': '27 May 2025',
      'assignBy': 'chandan singh',
    },
  ];
  final pendingTasks = [
    {
      'id': '67e60e33-6e91-4651-9ef6-54ca761b18e4',
      'task': 'test',
      'deadline': '07 April 2025',
      'assignBy': 'chandan singh',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return StatusBarCustom(
      child: CustomScaffold(
        appBar: const CustomAppBar(
          title: 'Assign Tasks',
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        indicatorColor: AppColors.primaryColor,
                        labelColor: AppColors.primaryColor,
                        unselectedLabelColor: AppColors.grey,
                        tabs: [
                          Tab(
                            icon: Icon(Icons.check_circle, size: 20),
                            text: 'Completed',
                          ),
                          Tab(
                            icon: Icon(Icons.schedule, size: 20),
                            text: 'Pending',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: TabBarView(
                          children: [
                            _buildCompletedTasks(context),
                            _buildPendingTasks(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompletedTasks(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: completedTasks.length,
      padding: const EdgeInsets.only(bottom: 16, top: 16),
      itemBuilder: (context, index) {
        final task = completedTasks[index];
        return TaskCard(
          task: task,
          taskName: task['task']!,
          deadline: task['deadline']!,
          assignBy: task['assignBy']!,
          completedDate: task['completedDate']!,
          isCompleted: true,
        );
      },
    );
  }

  Widget _buildPendingTasks(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      itemCount: pendingTasks.length,
      itemBuilder: (context, index) {
        final task = pendingTasks[index];
        return TaskCard(
          task: task,
          taskName: task['task']!,
          deadline: task['deadline']!,
          assignBy: task['assignBy']!,
          isCompleted: false,
        );
      },
    );
  }
}
