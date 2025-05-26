import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zinggerr/config/app_asset.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/screens/notification/notification_screen.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final String userName = "Vicky";
  final int totalCourses = 1;
  final int totalFaculty = 0;
  DateTime currentDate = DateTime.now();
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

  final List<Map<String, dynamic>> courses = [
    {
      "id": 1,
      "name": "Testing Nido Interactive Asset...",
      "slug": "Testing-Nido-Interactive-Assets",
      "image":
          "https://www.zinggerr.com/storage/courses/1Sp6GuEJSeMx0ebLRPtjMOwzykONeKsbrosmIfGa.jpg",
      "category": "Select Category",
      "tags": "Basic",
      "rating": 0,
    }
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: DashboardAppBar(
        onMenuPressed: () {
          // Handle menu button press
          Scaffold.of(context).openDrawer();
        },
        userName: 'Vicky Patel',
        userRole: '',
        userAvatar: AppAssets.avtar,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),

            const SizedBox(height: 20),

            // Stats Cards
            _buildStatsRow(isMobile),

            const SizedBox(height: 20),

            // Calendar Section
            _buildCalendarSection(),

            const SizedBox(height: 20),

            // Courses Section
            _buildCoursesSection(isMobile),

            const SizedBox(height: 20),

            // Notifications Section
            _buildNotificationsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back,",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.textColor,
              ),
        ),
        Text(
          userName,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                // fontWeight: FontWeight.,
                color: AppColors.primaryColor,
              ),
        ),
        // Text(
        //   DateFormat('EEEE, MMMM d, y').format(DateTime.now()),
        //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        //         color: AppColors.textColor.withOpacity(0.7),
        //       ),
        // ),
      ],
    );
  }

  Widget _buildStatsRow(bool isMobile) {
    return isMobile
        ? Column(
            children: [
              _buildStatCard(
                icon: Icons.book,
                value: totalCourses.toString(),
                label: "Total Courses",
              ),
              const SizedBox(height: 16),
              _buildStatCard(
                icon: Icons.people,
                value: totalFaculty.toString(),
                label: "Total Faculty",
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  icon: Icons.book,
                  value: totalCourses.toString(),
                  label: "Total Courses",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  icon: Icons.people,
                  value: totalFaculty.toString(),
                  label: "Total Faculty",
                ),
              ),
            ],
          );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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

  Widget _buildCalendarSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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
                      onPressed: () {
                        setState(() {
                          currentDate =
                              DateTime(currentDate.year, currentDate.month - 1);
                        });
                      },
                    ),
                    Text(
                      DateFormat('MMMM yyyy').format(currentDate),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: Icon(Icons.chevron_right,
                          color: AppColors.primaryColor),
                      onPressed: () {
                        setState(() {
                          currentDate =
                              DateTime(currentDate.year, currentDate.month + 1);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildCalendarGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
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

  Widget _buildCoursesSection(bool isMobile) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest Courses",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final course = courses[index];
                return Card(
                  elevation: 1,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: AppColors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Course ID and Rating
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
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < course["rating"]
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

                        // Course Image and Name
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

                        // Category and Tags
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            _buildInfoChip(
                              label: course["category"],
                              icon: Icons.category,
                            ),
                            _buildInfoChip(
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

  Widget _buildInfoChip({required String label, required IconData icon}) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
      backgroundColor: AppColors.grey.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: AppColors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      label: Row(
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
    );
  }

  Widget _buildCourseItem(Map<String, dynamic> course) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              course["image"],
              width: 60,
              height: 60,
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
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  course["slug"],
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textColor.withOpacity(0.6),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifications",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(),
                ),
                TextButton(
                  onPressed: () {
                    _showNotifications(context);
                  },
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
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.textColor.withOpacity(0.5),
                                  ),
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.zero,
                    onTap: () {},
                  ),
                  const Divider(height: 16),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final int notificationCount;
  final String userName;
  final String userRole;
  final String userAvatar;

  const DashboardAppBar({
    super.key,
    this.onMenuPressed,
    this.notificationCount = 0,
    required this.userName,
    required this.userRole,
    required this.userAvatar,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: onMenuPressed,
      ),
      title: Row(
        children: [
          if (MediaQuery.of(context).size.width > 600)
            Expanded(
              child: Container(
                height: 40,
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0CFFC),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.search, color: AppColors.primaryColor),
                    hintText: 'Search...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
        ],
      ),
      actions: [
        // Search button for mobile
        if (MediaQuery.of(context).size.width <= 600)
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: _showSearchDialog,
          ),

        // Notification icon with badge
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                _showNotifications(context);
              },
            ),
            if (notificationCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    notificationCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),

        // User profile
        // PopupMenuButton<String>(
        //   offset: const Offset(0, kToolbarHeight),
        //   itemBuilder: (context) => [
        //     PopupMenuItem(
        //       value: 'profile',
        //       child: ListTile(
        //         leading: const Icon(Icons.settings),
        //         title: Text('Account Settings'),
        //       ),
        //     ),
        //     PopupMenuItem(
        //       value: 'logout',
        //       child: ListTile(
        //         leading: const Icon(Icons.logout),
        //         title: Text('Logout'),
        //       ),
        //     ),
        //   ],
        //   onSelected: (value) {
        //     if (value == 'logout') {
        //       // Handle logout
        //     } else if (value == 'profile') {
        //       // Handle profile
        //     }
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //     child: Row(
        //       children: [
        //         CircleAvatar(
        //           radius: 20,
        //           backgroundImage: NetworkImage(userAvatar),
        //         ),
        //         const SizedBox(width: 8),
        //         Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               userName,
        //               style: const TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             Text(
        //               userRole,
        //               style: const TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 12,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }

  void _showSearchDialog() {
    // Implement search dialog for mobile
  }
}

void _showNotifications(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NotificationsScreen()),
  );
  // Implement notifications dialog
}
