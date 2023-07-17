import 'package:flutter/material.dart';
import 'package:focus_todo/todo_model/views/header_view.dart';
import 'package:focus_todo/todo_model/views/task_info_view.dart';
import 'package:focus_todo/todo_model/views/task_list_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 231, 212, 1),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Task Info View
            Expanded(
              flex: 1,
              child: Container(
                  color: const Color.fromRGBO(255, 156, 108, 0.6),
                  child: const TaskInfoView()),
            ),
            // Header View
            Expanded(
              flex: 1,
              child: Container(
                  color: const Color.fromRGBO(255, 156, 108, 0.6),
                  child: const HeaderView()),
            ),
            // Task List View
            const Expanded(flex: 7, child: TaskListView()),
          ],
        ),
      ),
    );
  }
}
