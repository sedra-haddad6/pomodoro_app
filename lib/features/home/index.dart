import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../timer/index.dart';
import 'controller.dart';
import '../tasks/add tasks/index.dart';

import 'widgets/tasks_title.dart';
import 'widgets/tasks_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      
      appBar: AppBar(title:  Text("الرئيسية")),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children:  [
          PomodoroWidget(),
          SizedBox(height: 30),
          TasksTitle(),
          SizedBox(height: 10),
          TasksList(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple, 
        foregroundColor: Colors.white,
        onPressed: () {
          Get.to(() => const AddTask());
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
