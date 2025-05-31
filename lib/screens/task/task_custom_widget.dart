import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';

class CompletedTasksList extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;

  const CompletedTasksList({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline,
                size: 48, color: AppColors.grey),
            const SizedBox(height: 16),
            Text(
              'No completed tasks yet',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textColor.withOpacity(0.6),
                  ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: tasks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final task = tasks[index];
        return PatternBackground(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryColor.withOpacity(0.03),
                    AppColors.greenLight.withOpacity(0.03),
                  ],
                ),
              ),
              child: InkWell(
                onTap: () => _showTaskDetails(context, task),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.greenLight.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check_rounded,
                              size: 20,
                              color: AppColors.greenLight,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task['title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                _buildTaskDetailItem(
                                  context,
                                  Icons.calendar_month_outlined,
                                  'Completed on ${task['completedDate']}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Divider(
                        height: 1,
                        color: AppColors.grey.withOpacity(0.3),
                      ),
                      const SizedBox(height: 12),
                      _buildTaskDetailItem(
                        context,
                        Icons.person_outline,
                        'Assigned by ${task['assignBy']}',
                      ),
                      _buildTaskDetailItem(
                        context,
                        Icons.timelapse_outlined,
                        'Deadline was ${task['deadline']}',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildTaskDetailItem(BuildContext context, IconData icon, String text,
    {bool isWarning = false, bool isUrgent = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: isWarning
              ? AppColors.errorColor
              : isUrgent
                  ? AppColors.errorColor
                  : AppColors.textColor.withOpacity(0.6),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isWarning
                    ? AppColors.errorColor
                    : isUrgent
                        ? AppColors.errorColor
                        : AppColors.textColor.withOpacity(0.8),
              ),
        ),
      ],
    ),
  );
}

///

class PendingTasksList extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;
  final void Function(Map<String, dynamic> task)? onComplete;

  const PendingTasksList({
    super.key,
    required this.tasks,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.assignment_turned_in_outlined,
                size: 48, color: AppColors.grey),
            const SizedBox(height: 16),
            Text(
              'No pending tasks right now',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textColor.withOpacity(0.6),
                  ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: tasks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final task = tasks[index];
        final isUrgent = _isTaskUrgent(task['deadline']);

        return PatternBackground(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryColor.withOpacity(0.03),
                    AppColors.accentColor.withOpacity(0.03),
                  ],
                ),
              ),
              child: InkWell(
                onTap: () => _showTaskDetails(context, task),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.pending_actions,
                              size: 20,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task['title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                _buildTaskDetailItem(
                                  context,
                                  Icons.calendar_month_outlined,
                                  'Due ${task['deadline']}',
                                  isUrgent: isUrgent,
                                ),
                              ],
                            ),
                          ),
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              value: false,
                              onChanged: (value) {
                                if (onComplete != null) {
                                  onComplete!(task);
                                }
                              },
                              activeColor: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Divider(
                        height: 1,
                        color: AppColors.grey.withOpacity(0.3),
                      ),
                      const SizedBox(height: 12),
                      _buildTaskDetailItem(
                        context,
                        Icons.person_outline,
                        'Assigned by ${task['assignBy']}',
                      ),
                      if (isUrgent)
                        _buildTaskDetailItem(
                          context,
                          Icons.warning_amber_rounded,
                          'Approaching deadline!',
                          isWarning: true,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bool _isTaskUrgent(String deadline) {
    final deadlineDate = DateTime.tryParse(deadline);
    if (deadlineDate == null) return false;

    final now = DateTime.now();
    final difference = deadlineDate.difference(now).inDays;

    return difference >= 0 && difference <= 2;
  }

  Widget _buildTaskDetailItem(
    BuildContext context,
    IconData icon,
    String text, {
    bool isUrgent = false,
    bool isWarning = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: isWarning
                ? Colors.red
                : isUrgent
                    ? Colors.orange
                    : Colors.grey[600],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isWarning
                        ? Colors.red
                        : isUrgent
                            ? Colors.orange
                            : Colors.grey[700],
                    fontWeight: isWarning ? FontWeight.w600 : null,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showTaskDetails(BuildContext context, Map<String, dynamic> task) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            task['title'],
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          _buildDetailItem(
              context, Icons.calendar_today, 'Deadline', task['deadline']),
          if (task['status'] == 'Completed')
            _buildDetailItem(context, Icons.event_available, 'Completed Date',
                task['completedDate']),
          _buildDetailItem(
              context, Icons.person_outline, 'Assign by', task['assignBy']),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: task['status'] == 'Completed'
                      ? AppColors.greenLight.withOpacity(0.2)
                      : AppColors.errorColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  task['status'],
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: task['status'] == 'Completed'
                            ? AppColors.greenLight
                            : AppColors.errorColor,
                      ),
                ),
              ),
              const Spacer(),
              if (task['status'] != 'Completed')
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // Mark as complete logic
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Mark Complete',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}

Widget _buildDetailItem(
    BuildContext context, IconData icon, String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppColors.primaryColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textColor.withOpacity(0.6),
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class TaskCard extends StatelessWidget {
  final String taskName;
  final String deadline;
  final String assignBy;
  final String? completedDate;
  final bool isCompleted;
  final VoidCallback? onTap;
  final Map<String, dynamic> task;

  const TaskCard({
    Key? key,
    required this.taskName,
    required this.deadline,
    required this.assignBy,
    this.completedDate,
    required this.isCompleted,
    this.onTap,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          _showTaskDetails(context, task);
        },
        child: PatternBackground(
            borderRadius: BorderRadius.circular(8),
            elevation: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isCompleted
                      ? AppColors.greenLight.withOpacity(0.3)
                      : AppColors.primaryColor.withOpacity(0.2),
                  width: 1.2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: isCompleted
                                ? AppColors.greenLight.withOpacity(0.18)
                                : AppColors.primaryColor.withOpacity(0.18),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isCompleted
                                ? Icons.check_circle
                                : Icons.pending_actions,
                            color: isCompleted
                                ? AppColors.greenLight
                                : AppColors.primaryColor,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            taskName,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: isCompleted
                                      ? AppColors.greenLight
                                      : AppColors.primaryColor,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            value: isCompleted,
                            onChanged: null,
                            activeColor: AppColors.greenLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildTaskDetailRow(
                      context,
                      icon: Icons.calendar_today,
                      label: 'Deadline:',
                      value: deadline,
                    ),
                    if (completedDate != null)
                      _buildTaskDetailRow(
                        context,
                        icon: Icons.event_available,
                        label: 'Completed:',
                        value: completedDate!,
                      ),
                    _buildTaskDetailRow(
                      context,
                      icon: Icons.person,
                      label: 'Assigned by:',
                      value: assignBy,
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: AppColors.grey.withOpacity(0.25),
                      height: 1,
                      thickness: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isCompleted
                                ? AppColors.greenLight.withOpacity(0.15)
                                : AppColors.errorColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            isCompleted ? 'Completed' : 'Pending',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: isCompleted
                                      ? AppColors.greenLight
                                      : AppColors.errorColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        const Spacer(),
                        if (!isCompleted)
                          InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              // Edit task action
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryColor
                                        .withOpacity(0.10),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(Icons.edit,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget _buildTaskDetailRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.primaryColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _showTaskDetails(BuildContext context, Map<String, dynamic> task) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(task['task']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${task['description'] ?? 'No description'}'),
            const SizedBox(height: 8),
            Text('Deadline: ${task['deadline']}'),
            if (task['completedDate'] != null)
              Text('Completed: ${task['completedDate']}'),
            const SizedBox(height: 8),
            Text('Assigned by: ${task['assignBy']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
