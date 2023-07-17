import 'package:flutter/material.dart';
import 'package:focus_todo/models/task_models.dart';
import 'package:focus_todo/models/user_models.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User("hnkk");

  Color clrLv1 = Colors.grey.shade50;
  Color clrLv2 = Colors.grey.shade200;
  Color clrLv3 = Colors.grey.shade800;
  Color clrLv4 = Colors.grey.shade900;

  int get numTasks => tasks.length;

  int get numTasksRemaining => tasks.where((task) => !task.completed).length;

  String get username => user.username;

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].completed;
  }

  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].completed = taskValue;
    notifyListeners();
  }

  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  void deleteCompletedTasks() {
    tasks = tasks.where((task) => !task.completed).toList();
    notifyListeners();
  }

  void updateUsername(String newuesrname) {
    user.username = newuesrname;
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetBuilder, BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: ((context) {
        return bottomSheetBuilder;
      }),
    );
  }
}
