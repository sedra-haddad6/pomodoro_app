import 'package:flutter/material.dart';
import '../../tasks/enum/enum.dart';

class TaskStatusBadge extends StatelessWidget {
  final TaskStatus status;

  const TaskStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
   
    Color color;
    String text;

    switch (status) {
      case TaskStatus.done:
        color = Colors.green;
        text = "Done";
        break;

      case TaskStatus.inProgress:
        color = Colors.blue;
        text = "In Progress";
        break;

      case TaskStatus.pending:
        color = Colors.red;
        text = "Pending";
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(  
        borderRadius: BorderRadius.circular(20), 
        border: Border.all(color: color, width: 2), 
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
