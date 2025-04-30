import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_asset.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<User> userList = [
      User(
        name: 'siya singh',
        email: 'siya@gmail.com',
        username: 'siya_singh',
        phone: '--',
        role: 'Student',
        gender: 'Male',
        isActive: true,
      ),
      // Add more users...
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(AppAssets.avtar),
                  ),
                  title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(user.email),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Chip(
                        label: Text(
                          user.role,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text('Username: ${user.username}')),
                          Expanded(child: Text('Phone: ${user.phone}')),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(child: Text('Gender: ${user.gender}')),
                          Row(
                            children: [
                              const Text('Status: '),
                              Icon(
                                user.isActive ? Icons.toggle_on : Icons.toggle_off,
                                size: 32,
                                color: user.isActive ? Colors.green : Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.edit, color: Colors.deepPurple),
                          SizedBox(width: 16),
                          Icon(Icons.info_outline, color: Colors.blue),
                          SizedBox(width: 16),
                          Icon(Icons.delete, color: Colors.red),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String username;
  final String phone;
  final String role;
  final String gender;
  final bool isActive;

  User({
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.role,
    required this.gender,
    required this.isActive,
  });
}
