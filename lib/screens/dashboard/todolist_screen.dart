import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  DateTime _selectedDate = DateTime.now();
  final List<Map<String, dynamic>> _tasks = [
    { 
      'title': 'new task1',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task2',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task1',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task2',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task1',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task2',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task1',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task2',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task1',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task2',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task1',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task2',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task1',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
    { 
      'title': 'new task2',
      'date': DateTime(2025, 5, 27),
      'status': 'Incomplete',
    }, 
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      // You can add filtering logic here based on the selected date
    }
  }

  void _deleteTask(String taskId) {
    setState(() {
      _tasks.removeWhere((task) => task['id'] == taskId);
    });
  }

  void _editTask(String taskId) {
    // Implement edit functionality
    debugPrint('Editing task $taskId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PatternBackground(
          child: ListView(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'To do List',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('dd MMM yyyy').format(_selectedDate),
                              ),
                              const Icon(Icons.calendar_today, size: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Task Table
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children:
                     _tasks.asMap().entries.map((entry){ 
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
                                task['title'].toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  size: 20, color: Colors.black),
                              onPressed: () {},
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
              // Add Task Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement add task functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      'Add Task',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
