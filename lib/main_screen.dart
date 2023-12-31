import 'dart:ui' as ui;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:focus_todo/background_manager.dart';
import 'package:focus_todo/main_icons.dart';

class Mascot extends StatefulWidget {
  const Mascot({super.key});
  @override
  State<Mascot> createState() => _MascotState();
}

class _MascotState extends State<Mascot> {
  final double scale = 1;
  final double height = 400;
  final double width = 300;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/character/default-character.png',
        width: 400, height: 400);
  }
}

class MainBottomButton extends StatelessWidget {
  final IconData icon;
  const MainBottomButton(this.icon, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        child: Icon(
          icon,
          size: 35,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    );
  }
}

class MainBottomBar extends StatelessWidget {
  const MainBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.red.withOpacity(0),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainBottomButton(Main.shirt_solid),
            MainBottomButton(Main.utensils_solid),
            MainBottomButton(Main.house_solid),
            MainBottomButton(Main.moon_solid),
            MainBottomButton(Main.pen_solid),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundManager(),
          Mascot(),
        ],
      ),
      bottomNavigationBar: MainBottomBar(),
    );
  }
}
