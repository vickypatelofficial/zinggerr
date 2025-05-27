import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/screens/notification/notification_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? showSearchDialog;
  final void Function(BuildContext) showNotifications;
  final int notificationCount;
  final String? title;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    this.onMenuPressed,
    this.showSearchDialog,
    required this.showNotifications,
    required this.notificationCount,
    this.title,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      leading: onMenuPressed != null
          ? IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: onMenuPressed,
            )
          : null,
      title: Text(title ?? '',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.white,
                fontSize: 20,
              )),
      bottom: bottom,
      actions: [
        if (showSearchDialog != null)
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: showSearchDialog,
          ),
        Stack(
          children: [
            IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NotificationsScreen();
                  }));
                }),
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
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
