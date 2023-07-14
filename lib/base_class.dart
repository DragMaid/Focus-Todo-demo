import 'package:flutter/material.dart';
import 'package:focus_todo/main_icons.dart';

class MainBottomButton extends StatelessWidget {
  final IconData icon;
  final String name;
  final String screenName;
  const MainBottomButton(this.name, this.icon, this.screenName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: 3, color: Colors.brown),
            borderRadius: BorderRadius.circular(100)),
        heroTag: name,
        child: Icon(
          icon,
          size: 35,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pushNamed(context, screenName);
        },
      ),
    );
  }
}

class MainBottomBar extends StatelessWidget {
  late final List<MainBottomButton> btnContainer;
  MainBottomBar({super.key}) {
    btnContainer = const [
      MainBottomButton("Cloth", Main.shirt_solid, '/mainscreen'),
      MainBottomButton("IDK", Main.utensils_solid, '/pomoscreen'),
      MainBottomButton("Home", Main.house_solid, '/todoscreen'),
      MainBottomButton("Sleep", Main.moon_solid, '/mainscreen'),
      MainBottomButton("Edit", Main.pen_solid, '/mainscreen'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      //color: Colors.pink,
      alignment: FractionalOffset.bottomCenter,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: btnContainer,
        ),
      ),
    );
  }
}

class BaseClass extends StatelessWidget {
  final List<Widget> managerContainer;
  final List<Widget> widgetContainer;
  final List<Widget> defaultWidget = [MainBottomBar()];

  BaseClass(
      {required this.widgetContainer,
      required this.managerContainer,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: List.from(managerContainer)
            ..addAll(List.from(widgetContainer)..addAll(defaultWidget))),
    );
  }
}
