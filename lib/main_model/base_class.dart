import 'package:flutter/material.dart';

import 'package:focus_todo/widgets/pomodoro_widget.dart';
import 'package:focus_todo/widgets/todo_widget.dart';
import 'package:focus_todo/widgets/barchart_widget.dart';
import 'package:focus_todo/widgets/credit_widget.dart';

class MainBottomButton extends StatefulWidget {
  final IconData icon;
  final String name;
  final Function(Widget) func;
  final Widget customWidget;
  const MainBottomButton(
      {required this.name,
      required this.icon,
      required this.func,
      required this.customWidget,
      super.key});
  @override
  State<MainBottomButton> createState() => _MainBottomButtonState();
}

class _MainBottomButtonState extends State<MainBottomButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    double highlightWidth = _isPressed ? 10 : 3;
    Color highlightColor = _isPressed ? Colors.blue : Colors.brown;
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: highlightWidth, color: highlightColor),
            borderRadius: BorderRadius.circular(200)),
        heroTag: widget.name,
        child: Icon(
          widget.icon,
          size: 40,
          color: Colors.black,
        ),
        onPressed: () {
          setState(() {
            widget.func(widget.customWidget);
            _isPressed = !_isPressed;
          });
        },
      ),
    );
  }
}

class MainBottomBar extends StatefulWidget {
  late final List<MainBottomButton> btnContainer;
  final Function(Widget) func;

  // Precache widget initialization
  final PomodoroTimer timerWidget = const PomodoroTimer();
  final TodoWidget todoWidget = const TodoWidget();
  final BarChartWidget barWidget = const BarChartWidget();
  final CreditWidget creditWidget = const CreditWidget();

  MainBottomBar({required this.func, super.key}) {
    btnContainer = [
      MainBottomButton(
        name: "Timer",
        icon: Icons.watch_later_rounded,
        func: func,
        customWidget: timerWidget,
      ),
      MainBottomButton(
          name: "Todo",
          icon: Icons.edit_rounded,
          func: func,
          customWidget: todoWidget),
      MainBottomButton(
          name: "Home", icon: Icons.home, func: func, customWidget: Text('')),
      MainBottomButton(
          name: "Sleep",
          icon: Icons.bar_chart_outlined,
          func: func,
          customWidget: barWidget),
      MainBottomButton(
          name: "Edit",
          icon: Icons.settings,
          func: func,
          customWidget: creditWidget),
    ];
  }
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.btnContainer,
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
