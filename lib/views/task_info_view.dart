import 'package:flutter/material.dart';
import 'package:focus_todo/views_models/app_view_model.dart';
import 'package:provider/provider.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Row(
          children: [
            //Total Tasks
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                      color: viewModel.clrLv2,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                              child: Text(
                            '${viewModel.numTasks}',
                            style: TextStyle(
                                fontSize: 28,
                                color: viewModel.clrLv3,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: FittedBox(
                            child: Text(
                              'so task',
                              style: TextStyle(
                                  color: viewModel.clrLv4,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(width: 20),
            // Remaining
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                      color: viewModel.clrLv2,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                              child: Text(
                            '${viewModel.numTasksRemaining}',
                            style: TextStyle(
                                fontSize: 28,
                                color: viewModel.clrLv3,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: FittedBox(
                            child: Text(
                              'da xong',
                              style: TextStyle(
                                  color: viewModel.clrLv4,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      );
    });
  }
}
