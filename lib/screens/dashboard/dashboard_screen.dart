import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/screens/dashboard/custom_end_drawer.dart';
import 'package:zinggerr/screens/dashboard/dashboard_custom_widgets.dart';
import 'package:zinggerr/screens/dashboard/todolist_screen.dart';
import 'package:zinggerr/screens/notification/notification_screen.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';

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

 GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomEndDrawer(notificationCount: 5), 
      appBar: CustomAppBar(
        title: 'Dashboard',
        onMenuPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
        showNotifications: (context) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NotificationsScreen();
          }));
        },
        notificationCount: 3,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Column(
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
                        color: AppColors.primaryColor,
                      ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Stats Cards
            BuildStatsRow(
                totalCourses: totalCourses, totalFaculty: totalCourses),

            const SizedBox(height: 20),

            // Calendar Section
            CalendarSectionCustom(
              currentDate: currentDate,
              onPrevious: () {
                setState(() {
                  currentDate =
                      DateTime(currentDate.year, currentDate.month - 1);
                });
              },
              onNext: () {
                setState(() {
                  currentDate =
                      DateTime(currentDate.year, currentDate.month + 1);
                });
              },
            ),

            const SizedBox(height: 20),

            // Courses Section
            CoursesSectionCustom(
              courses: courses,
            ),

            const SizedBox(height: 20),

            const DashboardStatsSectionCustom(),

            const SizedBox(
              height: 20,
            ),

            // Notifications Section
            NotificationSectionCustom(
              notifications: notifications,
              onViewAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationsScreen()),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TodoCardWidgetCustom(
              date: '27 May 2025',
              tasks: ["new task", "second task"],
              onAdd: () {},
              onViewAll: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ToDoListScreen();
                }));
              },
              onDeleteTask: (index) {},
            ),
          ],
        ),
      ),
    );
  }

  ////
}
