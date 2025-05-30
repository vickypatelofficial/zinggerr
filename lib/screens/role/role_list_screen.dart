import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';
import 'package:zinggerr/widgets/custom_scaffold.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';
import 'package:zinggerr/widgets/custom_text_field.dart';

class RolesListScreen extends StatelessWidget {
  const RolesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - replace with your actual data source
    final roles = [
      {
        'id': '8b92c016-e92f-4591-9bf8-1dd65a922747',
        'name': 'Faculty',
        'description': 'Faculty Users',
        'index': 1,
      },
      {
        'id': '50d578e0-e520-4a3d-824b-b15751b272f0',
        'name': 'Student',
        'description': 'Student Users',
        'index': 2,
      },
      {
        'id': '47d76fe2-ba41-4041-ab3f-a0942efec367',
        'name': 'Admin',
        'description': 'Admin Users',
        'index': 3,
      },
    ];

    return StatusBarCustom(
      child: CustomScaffold(
        child: Column(
          children: [
            const CustomAppBar(
              title: 'Roles List',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Header with search
                    CustomTextFormWidget(
                      hintText: 'Search...',
                      prefixWidget: const Icon(Icons.search),
                      contentpadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Please enter a search term';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Roles List
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 8),
                        itemCount: roles.length,
                        separatorBuilder: (context, index) => const Divider(
                          height: 1,
                          color: Colors.white24,
                        ),
                        itemBuilder: (context, index) {
                          final role = roles[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: RoleListItem(
                              index: role['index'] as int,
                              name: role['name'] as String,
                              description: role['description'] as String,
                              onEdit: () {
                                // Handle edit action
                                // Navigator.push(...);
                              },
                              onDelete: () {
                                // Handle delete action with confirmation
                                _showDeleteConfirmation(
                                    context, role['id'] as String);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, String roleId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Confirm Delete',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        content: Text(
          'Are you sure you want to delete this role?',
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
              Navigator.pop(context);
              // Call your delete function here
              // deleteRole(roleId);
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

class RoleListItem extends StatelessWidget {
  final int index;
  final String name;
  final String description;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const RoleListItem({
    super.key,
    required this.index,
    required this.name,
    required this.description,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return PatternBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Index
            Container(
              width: 30,
              alignment: Alignment.center,
              child: Text(
                '$index',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
              ),
            ),
            const SizedBox(width: 12),
            // Name and Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                  ),
                ],
              ),
            ),
            // Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: onEdit,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: onDelete,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.errorColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.delete,
                        size: 20,
                        color: AppColors.errorColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
