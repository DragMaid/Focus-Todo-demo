// Base libraries import
import 'package:flutter/material.dart';

// App screens import
import 'package:focus_todo/main_screen.dart';
//import 'package:focus_todo/pomodoro_screen.dart';
//import 'package:focus_todo/todo_screen.dart';

// App behavior manager import
//import 'package:focus_todo/gesture_manager.dart';
import 'package:focus_todo/background_manager.dart';

// External libraries import
import 'package:focus_todo/views_models/app_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // Managers initialization
  final BackgroundManager bgManager = const BackgroundManager();

// Screens initialization
  late final MainScreen mainScreen = MainScreen(managerContainer: [bgManager]);
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDStudy',
      home: mainScreen,
    );
  }
}
