import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';

class UserListItem extends StatelessWidget {
  final String image;
  final String name;
  final String email;
  final String username;
  final String phone;
  final String role;
  final String gender;
  final bool status;
  final VoidCallback onEdit;
  final VoidCallback onInfo;
  final VoidCallback onDelete;
  final ValueChanged<bool>? onStatusChanged;

  const UserListItem({
    super.key,
    required this.image,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.role,
    required this.gender,
    required this.status,
    required this.onEdit,
    required this.onInfo,
    required this.onDelete,
    this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PatternBackground(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: Image.network(
                    image,
                    width: 52,
                    height: 52,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person, size: 52),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // User Details
            _buildDetailRow(context, 'Username', username),
            _buildDetailRow(context, 'Phone', phone),
            _buildDetailRow(context, 'Role', role, isBadge: true),
            _buildDetailRow(context, 'Gender', gender),

            // Status and Actions
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Status Toggle
                Row(
                  children: [
                    Text(
                      'Status: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: status,
                        onChanged: onStatusChanged,
                        activeColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),

                // Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Edit
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

                    // Permission
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: onInfo,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.info_outline,
                            size: 20,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Delete
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
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value,
      {bool isBadge = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (isBadge)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                value,
                style: TextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
            )
          else
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
        ],
      ),
    );
  }
}
