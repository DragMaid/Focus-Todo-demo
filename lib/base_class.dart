import 'package:flutter/material.dart';
import 'package:focus_todo/main_icons.dart';

import 'package:focus_todo/pomodoro_widget.dart';

class MainBottomButton extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function(Widget) func;
  final Widget widget;
  const MainBottomButton(
      {required this.name,
      required this.icon,
      required this.func,
      required this.widget,
      super.key});

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
          func(widget);
        },
      ),
    );
  }
}

class MainBottomBar extends StatelessWidget {
  late final List<MainBottomButton> btnContainer;
  final Function(Widget) func;

  // Precache widget initialization
  final PomodoroTimer timerWidget = const PomodoroTimer();
  MainBottomBar({required this.func, super.key}) {
    btnContainer = [
      MainBottomButton(
        name: "Cloth",
        icon: Main.shirt_solid,
        func: func,
        widget: timerWidget,
      ),
      MainBottomButton(
          name: "IDK", icon: Main.utensils_solid, func: func, widget: Text('')),
      MainBottomButton(
          name: "Home", icon: Main.house_solid, func: func, widget: Text('')),
      MainBottomButton(
          name: "Sleep", icon: Main.moon_solid, func: func, widget: Text('')),
      MainBottomButton(
          name: "Edit", icon: Main.pen_solid, func: func, widget: Text('')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      //color: Colors.pink,
      alignment: FractionalOffset.bottomCenter,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: btnContainer,
            )),
      ),
    );
  }
}

class BaseClass extends StatefulWidget {
  final List<Widget> managerContainer;
  final List<Widget> widgetContainer;
  late List<Widget> defaultWidget;

  BaseClass(
      {required this.widgetContainer,
      required this.managerContainer,
      super.key});

  @override
  State<BaseClass> createState() => _BaseClassState();
}

class _BaseClassState extends State<BaseClass> {
  static bool _widgetOn = false;

  Opacity blurScreen = Opacity(
    opacity: _widgetOn ? 0.5 : 0,
    child: Container(color: Colors.black),
  );

  late List<Widget> allContainer = [
    ...widget.managerContainer,
    ...widget.widgetContainer,
    blurScreen,
    //...widget.defaultWidget,
    MainBottomBar(func: toggleWidget),
  ];

  void addWidget(Widget widget) {
    setState(() {
      allContainer.insert(allContainer.length - 1, widget);
      _widgetOn = !_widgetOn;
    });
  }

  void removeWidget() {
    setState(() {
      allContainer.removeAt(allContainer.length - 2);
      _widgetOn = !_widgetOn;
    });
  }

  void toggleWidget(Widget widget) {
    if (!_widgetOn) {
      addWidget(widget);
    } else {
      removeWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: allContainer));
  }
}
