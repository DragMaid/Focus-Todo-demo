import 'package:flutter/material.dart';
import 'package:focus_todo/todo_model/views_models/app_view_model.dart';
import 'package:provider/provider.dart';

class DeleteBottomSheetView extends StatelessWidget {
  const DeleteBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return SizedBox(
          height: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    viewModel.deleteAllTasks();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: viewModel.clrLv1,
                      backgroundColor: viewModel.clrLv3,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text('delete all')),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    viewModel.deleteCompletedTasks();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: viewModel.clrLv1,
                      backgroundColor: viewModel.clrLv3,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text('delete completed')),
            ],
          ),
        );
      },
    );
  }
}
