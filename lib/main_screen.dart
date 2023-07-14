import 'package:flutter/material.dart';
import 'package:focus_todo/base_class.dart';

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
    return Container(
      alignment: Alignment.center,
      child: Image.asset('assets/character/default-character.png',
          width: width, height: height),
    );
  }
}

class MainScreen extends StatelessWidget {
  late final BaseClass baseScreen;
  MainScreen({required List<Widget> managerContainer, super.key}) {
    baseScreen = BaseClass(
      widgetContainer: const [Mascot()],
      managerContainer: managerContainer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return baseScreen;
  }
}
