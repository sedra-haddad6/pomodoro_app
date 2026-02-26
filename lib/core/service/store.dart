import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/tasks/model/task.dart';


class TaskService {
  static const String key = "tasks";

  

  
  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonList = tasks.map((task) => jsonEncode(task.toMap())).toList();
    prefs.setStringList(key, jsonList);
  }

  
  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList(key);

    if (jsonList == null) return [];

    return jsonList.map((json) {
      return Task.fromMap(jsonDecode(json));
    }).toList();
  }
}
