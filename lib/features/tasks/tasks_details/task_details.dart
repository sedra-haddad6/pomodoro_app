import 'package:flutter/material.dart';
import '../model/task.dart';

class TaskDetailsPage extends StatelessWidget {
  final Task task;

  const TaskDetailsPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل المهمة"),
        actions: [IconButton(icon: const Icon(Icons.edit), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
SizedBox(height: 8),

            Divider(thickness: 1.2, color:  Colors.green),
            SizedBox(height: 12),

            Text(task.description, style: TextStyle(fontSize: 16)),

            
            SizedBox(height: 12),

            Text(
              "المدة: ${task.expectedDuration} دقيقة",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 8),

            Text(
              "التاريخ: ${task.expectedDate.toString().split(" ")[0]}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
