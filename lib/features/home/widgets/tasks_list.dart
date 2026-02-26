import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tasks/tasks_details/task_details.dart';
import '../controller.dart';
import 'task_status_badge.dart';

class TasksList extends GetView<HomeController> {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.tasks.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text("لا توجد مهام حالياً"),
          ),
        );
      }

      return Column(
        children: controller.tasks.map((task) {
          return Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(onTap: () { Get.to(() => TaskDetailsPage(task: task)); },
              title: Text(task.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
             subtitle: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(task.description, maxLines: 2,overflow: TextOverflow.ellipsis,),
    const SizedBox(height: 4),
    Text("التاريخ: ${task.expectedDate.toString().split(" ")[0]}"),
    Text("المدة: ${task.expectedDuration} دقيقة"),
  ],
),

              trailing: TaskStatusBadge(status: task.status),

            ),
          );
        }).toList(),
      );
    });
  }
}
