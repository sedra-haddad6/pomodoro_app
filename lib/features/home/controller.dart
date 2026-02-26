import 'package:get/get.dart';
import '../../core/service/store.dart';


import '../tasks/model/task.dart';

class HomeController extends GetxController {
  var tasks = <Task>[].obs;

  @override
  void onInit() {
    loadTasks();
    super.onInit();
  }

  void loadTasks() async {
    tasks.value = await TaskService.loadTasks();
  }

  void addTask(Task task) async {
    tasks.add(task);
    await TaskService.saveTasks(tasks);
  }
}
