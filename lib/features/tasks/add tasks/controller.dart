

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../enum/enum.dart';
import '../model/task.dart';


class AddTaskController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var title = "".obs;
  var description = "".obs;
  var duration = 0.obs;
  var date = DateTime.now().obs;
  var status = TaskStatus.pending.obs;



bool validate() {
   return formKey.currentState!.validate();
    }



  Task createTask() {
    return Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title.value,
      description: description.value,
      expectedDuration: duration.value,
      expectedDate: date.value,
      status: status.value,
    );

    
  }
}
