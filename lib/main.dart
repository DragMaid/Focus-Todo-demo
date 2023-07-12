import 'package:flutter/material.dart';
import 'package:focus_todo/main_screen.dart';
import 'package:focus_todo/pomodoro_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}
