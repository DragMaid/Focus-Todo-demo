import 'package:flutter/material.dart';
import 'package:focus_todo/views_models/app_view_model.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Container(
            decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 244, 232, 1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: Container(
              margin: const EdgeInsets.only(bottom: 80),
              child: ListView.separated(
                padding: const EdgeInsets.all(15),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: viewModel.numTasks,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      viewModel.deleteTask(index);
                    },
                    background: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child:
                              Icon(Icons.delete, color: Colors.red.shade700)),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFffffcc),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          side: BorderSide(width: 2, color: viewModel.clrLv3),
                          checkColor: viewModel.clrLv1,
                          activeColor: viewModel.clrLv3,
                          value: viewModel.getTaskValue(index),
                          onChanged: (value) {
                            viewModel.setTaskValue(index, value!);
                          },
                        ),
                        title: Text(viewModel.getTaskTitle(index),
                            style: TextStyle(
                                color: viewModel.clrLv4,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  );
                },
              ),
            ));
      },
    );
  }
}
