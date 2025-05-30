import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/screens/dashboard/dashboard_screen.dart';
import 'package:zinggerr/screens/events/create_event_screen.dart';
import 'package:zinggerr/screens/events/event_list_screen.dart';
import 'package:zinggerr/screens/role/create_role_screen.dart';
import 'package:zinggerr/screens/role/role_list_screen.dart'
    show RolesListScreen;
import 'package:zinggerr/screens/task/assign_task_screen.dart';
import 'package:zinggerr/screens/task/create_task_screen.dart';
import 'package:zinggerr/screens/task/task_screen.dart';
import 'package:zinggerr/screens/user/create_user_screen.dart';
import 'package:zinggerr/screens/user/student_list_screen.dart';
import 'package:zinggerr/screens/user/user_list_screen.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';

class CustomEndDrawer extends StatefulWidget {
  final int notificationCount;

  const CustomEndDrawer({super.key, this.notificationCount = 2});

  @override
  State<CustomEndDrawer> createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.white,
                  child: Icon(Icons.person,
                      color: AppColors.primaryColor, size: 30),
                ),
                const SizedBox(height: 8),
                Text(
                  'Vicky Patel',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.white,
                      ),
                ),
                Text(
                  'vickypatel19092002@gmail.com',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.white.withOpacity(0.7),
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: AppColors.textColor),
            title: Text(
              'Dashboard',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
              );
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.school, color: AppColors.textColor),
            title: Text(
              'Montessori Training',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            childrenPadding: const EdgeInsets.only(left: 20.0),
            children: <Widget>[
              ExpansionTile(
                title: Text(
                  'Montessori (0-3 years)',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                childrenPadding: const EdgeInsets.only(left: 20.0),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Nido (2-14 Months)',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Infant (14 Months- 3 Years)',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Casa Dei Bambini (3-6 years)',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                childrenPadding: const EdgeInsets.only(left: 20.0),
                children: <Widget>[
                  ListTile(
                    title: Text('Language',
                        style: Theme.of(context).textTheme.bodySmall),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Sensorial',
                        style: Theme.of(context).textTheme.bodySmall),
                    selected: true,
                    selectedTileColor: AppColors.primaryColor.withOpacity(0.1),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Practical Life',
                        style: Theme.of(context).textTheme.bodySmall),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Cultural Studies',
                        style: Theme.of(context).textTheme.bodySmall),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Mathematics',
                        style: Theme.of(context).textTheme.bodySmall),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.people, color: AppColors.textColor),
            title: Text(
              'Users',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            childrenPadding: const EdgeInsets.only(left: 20.0),
            children: <Widget>[
              ListTile(
                title: Text('Create',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddUserScreen(),
                      ));
                },
              ),
              ListTile(
                title:
                    Text('List', style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserListScreen(),
                      ));
                },
              ),
              ListTile(
                title: Text('Faculty',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Students',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StudentListScreen(),
                      ));
                },
              ),
            ],
          ),
          ExpansionTile(
            leading:
                const Icon(Icons.shield_outlined, color: AppColors.textColor),
            title: Text(
              'Role',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            childrenPadding: const EdgeInsets.only(left: 20.0),
            children: <Widget>[
              ListTile(
                title: Text('Create',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateRoleScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title:
                    Text('List', style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RolesListScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.lock_outline, color: AppColors.textColor),
            title: Text(
              'Permissions',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            childrenPadding: const EdgeInsets.only(left: 20.0),
            children: <Widget>[
              ListTile(
                title: Text('Create',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('List', style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.settings, color: AppColors.textColor),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            childrenPadding: const EdgeInsets.only(left: 20.0),
            children: <Widget>[
              ExpansionTile(
                title: Text(
                  'Montessori',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                childrenPadding: const EdgeInsets.only(left: 20.0),
                children: <Widget>[
                  ListTile(
                    title: Text('Age Group',
                        style: Theme.of(context).textTheme.bodySmall),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Areas',
                        style: Theme.of(context).textTheme.bodySmall),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Courses',
                        style: Theme.of(context).textTheme.bodySmall),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Category',
                        style: Theme.of(context).textTheme.bodySmall),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ListTile(
                title: Text('Account',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.event, color: AppColors.textColor),
            title: Text(
              'Events',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            childrenPadding: const EdgeInsets.only(left: 20.0),
            children: <Widget>[
              ListTile(
                title: Text('Create',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateEventScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title:
                    Text('List', style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EventsListScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.checklist, color: AppColors.textColor),
            title: Text(
              'Tasks',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            childrenPadding: const EdgeInsets.only(left: 20.0),
            children: <Widget>[
              ListTile(
                title: Text('Create',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateTaskScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title:
                    Text('List', style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TaskScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Assign',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>   AssignTasksScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading:
                const Icon(Icons.video_camera_back, color: AppColors.textColor),
            title: Text(
              'Video Conference',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            childrenPadding: const EdgeInsets.only(left: 20.0),
            children: <Widget>[
              ListTile(
                title: Text('Meetings',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('History',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ListTile(
            leading:
                const Icon(Icons.notifications, color: AppColors.textColor),
            title: Text(
              'Notifications',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: widget.notificationCount > 0
                ? Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      widget.notificationCount.toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : null,
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}





