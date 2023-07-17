import 'package:focus_todo/todo_model/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:focus_todo/todo_model/bottom_sheets/add_task_bottom_sheet_view.dart';
import 'package:focus_todo/todo_model/views_models/app_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Row(
            children: [
              // trash icon
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      viewModel.bottomSheetBuilder(
                          const DeleteBottomSheetView(), context);
                    },
                    child: Icon(
                      Icons.delete,
                      color: viewModel.clrLv3,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      viewModel.bottomSheetBuilder(
                          const AddTaskBottomSheetView(), context);
                    },
                    child: Icon(
                      Icons.add,
                      color: viewModel.clrLv3,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
