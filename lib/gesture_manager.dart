import 'package:flutter/material.dart';
import 'package:focus_todo/todo_screen.dart';
import 'dart:developer';

class GestureManager extends StatefulWidget {
  const GestureManager({super.key});
  @override
  State<GestureManager> createState() => _GestureManagerState();
}

class _GestureManagerState extends State<GestureManager> {
  int _screenCount = 2;
  int _screenIndex = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("Hello");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TodoScreen()),
        );
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! < 0) {
          if (_screenIndex < _screenCount) {
            //Navigator.push(
            //context,
            //MaterialPageRoute(builder: (context) => const PomodoroScreen()),
            //);
            _screenIndex++;
          }
        }
        if (details.primaryVelocity! > 0) {
          if (_screenIndex > 1) {
            Navigator.pop(context);
            _screenIndex--;
          }
        }
      },
    );
  }
}
