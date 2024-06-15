import 'package:flutter/material.dart';

enum TaskStatus {
  Done,
  Due,
  Completed,
}

class Task extends StatelessWidget {
  Task({super.key});

  final List<Map<String, dynamic>> tasks = [
    {'title': 'Task 1', 'status': TaskStatus.Done},
    {'title': 'Task 2', 'status': TaskStatus.Due},
    {'title': 'Task 3', 'status': TaskStatus.Completed},
    {'title': 'Task 4', 'status': TaskStatus.Done},
    {'title': 'Task 5', 'status': TaskStatus.Completed},
  ];

  Color getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.Done:
        return Colors.green;
      case TaskStatus.Due:
        return Colors.grey;
      case TaskStatus.Completed:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF318CE7),
        title: const Text(style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),'Task List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: getStatusColor(tasks[index]['status']),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    tasks[index]['title'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
