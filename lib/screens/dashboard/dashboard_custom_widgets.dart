import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/config/app_fonts.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';
import 'package:intl/intl.dart';

class BuildStatsRow extends StatelessWidget {
  final int totalCourses;
  final int totalFaculty;

  const BuildStatsRow({
    Key? key,
    required this.totalCourses,
    required this.totalFaculty,
  }) : super(key: key);

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String value,
    required String label,
  }) {
    return PatternBackground(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                ),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textColor.withOpacity(0.7),
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildStatCard(
          context,
          icon: Icons.book,
          value: totalCourses.toString(),
          label: "Total Courses",
        ),
        const SizedBox(height: 16),
        _buildStatCard(
          context,
          icon: Icons.people,
          value: totalFaculty.toString(),
          label: "Total Faculty",
        ),
      ],
    );
  }
}

// calender

class CalendarSectionCustom extends StatelessWidget {
  final DateTime currentDate;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const CalendarSectionCustom({
    super.key,
    required this.currentDate,
    required this.onNext,
    required this.onPrevious,
  });

  Widget _buildCalendarGrid(BuildContext context) {
    DateTime firstDay = DateTime(currentDate.year, currentDate.month, 1);
    int daysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;
    int startingWeekday = firstDay.weekday % 7;

    List<int?> days = [];
    for (int i = 0; i < startingWeekday; i++) {
      days.add(null);
    }
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(i);
    }

    List<List<int?>> weeks = [];
    for (int i = 0; i < days.length; i += 7) {
      weeks.add(days.sublist(i, i + 7 > days.length ? days.length : i + 7));
    }

    return Column(
      children: [
        // Weekday headers
        Row(
          children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
              .map((day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ),
                  ))
              .toList(),
        ),

        const SizedBox(height: 8),

        // Calendar days
        Column(
          children: weeks.map((week) {
            return Row(
              children: week.map((day) {
                if (day == null) {
                  return Expanded(
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.all(2),
                    ),
                  );
                }

                bool isToday = day == DateTime.now().day &&
                    currentDate.month == DateTime.now().month &&
                    currentDate.year == DateTime.now().year;

                return Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: isToday
                          ? AppColors.primaryColor.withOpacity(0.2)
                          : null,
                      borderRadius: BorderRadius.circular(8),
                      border: isToday
                          ? Border.all(color: AppColors.primaryColor)
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        day.toString(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: isToday
                                  ? AppColors.primaryColor
                                  : AppColors.textColor,
                              fontWeight:
                                  isToday ? FontWeight.bold : FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PatternBackground(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Calendar",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chevron_left,
                          color: AppColors.primaryColor),
                      onPressed: onPrevious,
                    ),
                    Text(
                      DateFormat('MMMM yyyy').format(currentDate),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: Icon(Icons.chevron_right,
                          color: AppColors.primaryColor),
                      onPressed: onNext,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildCalendarGrid(context),
          ],
        ),
      ),
    );
  }
}

// Courses

class CoursesSectionCustom extends StatelessWidget {
  final List<Map<String, dynamic>> courses;

  const CoursesSectionCustom({
    super.key,
    required this.courses,
  });

  Widget _buildInfoChip(BuildContext context,
      {required String label, required IconData icon}) {
    final BorderRadius borderRadius = BorderRadius.circular(5);
    return PatternBackground(
      elevation: .5,
      borderRadius: borderRadius,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: AppColors.textColor.withOpacity(0.6),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textColor.withOpacity(0.8),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PatternBackground(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title + View All
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest Courses",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontFamily: AppFonts.semiBold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// Course List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final course = courses[index];
                return PatternBackground(
                  elevation: .5,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Course ID and Rating
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "#${course["id"]}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Row(
                              children: List.generate(5, (i) {
                                return Icon(
                                  i < course["rating"]
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.amber,
                                  size: 16,
                                );
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        /// Image + Info
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                course["image"],
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course["name"],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    course["slug"],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: AppColors.textColor
                                              .withOpacity(0.6),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        /// Category + Tags
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            _buildInfoChip(
                              context,
                              label: course["category"],
                              icon: Icons.category,
                            ),
                            _buildInfoChip(
                              context,
                              label: course["tags"],
                              icon: Icons.tag,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// States Section

class DashboardStatsSectionCustom extends StatelessWidget {
  const DashboardStatsSectionCustom({super.key});

  Widget dashboardStatCard({
    required String iconName,
    required String count,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(_getIcon(iconName), color: Colors.blue),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                count,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(label, style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String name) {
    switch (name) {
      case 'person':
        return Icons.person;
      case 'book':
        return Icons.book;
      case 'local_mall':
        return Icons.local_mall;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PatternBackground(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: dashboardStatCard(
                    iconName: 'person',
                    count: '0',
                    label: 'Students',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: dashboardStatCard(
                    iconName: 'person',
                    count: '0',
                    label: 'Faculty',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: dashboardStatCard(
                    iconName: 'book',
                    count: '0',
                    label: 'Courses',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: dashboardStatCard(
                    iconName: 'local_mall',
                    count: '100%',
                    label: 'Order',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Notification

class NotificationSectionCustom extends StatelessWidget {
  final List<Map<String, dynamic>> notifications;
  final VoidCallback onViewAll;

  const NotificationSectionCustom({
    super.key,
    required this.notifications,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return PatternBackground(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifications",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextButton(
                  onPressed: onViewAll,
                  child: Text(
                    "View all",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                  ),
                ),
              ],
            ),

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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
                                  color: AppColors.textColor.withOpacity(0.5)),
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
    );
  }
}

////

class TodoCardWidgetCustom extends StatelessWidget {
  final String date;
  final List<String> tasks;
  final VoidCallback onAdd;
  final VoidCallback onViewAll;
  final void Function(int index) onDeleteTask;

  const TodoCardWidgetCustom({
    super.key,
    required this.date,
    required this.tasks,
    required this.onAdd,
    required this.onViewAll,
    required this.onDeleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return PatternBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// --- Header ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'To Do List ',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '($date)',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: onViewAll,
                  child: Text(
                    "View all",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                  ),
                ),
              ],
            ),
          ),

          /// --- Task List ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: tasks.asMap().entries.map((entry) {
                final index = entry.key;
                final task = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: PatternBackground(
                    child: Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged:
                              (val) {}, // You can pass logic via parameter if needed
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          activeColor: Colors.blueAccent,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            task,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline,
                              size: 20, color: Colors.black),
                          onPressed: () => onDeleteTask(index),
                          tooltip: 'Delete Task',
                          splashRadius: 20,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          /// --- Footer ---
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: onAdd,
                  child: Text(
                    "Add Task",
                    style: Theme.of(context)
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
    );
  }
}
