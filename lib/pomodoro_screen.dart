import 'package:flutter/material.dart';
import 'package:focus_todo/base_class.dart';
import 'dart:async';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({super.key});
  @override
  State<PomodoroTimer> createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  String strDigits(int n) => n.toString().padLeft(2, '0');
  late final hours = strDigits(myDuration.inHours.remainder(24));
  late final minutes = strDigits(myDuration.inMinutes.remainder(60));
  late final seconds = strDigits(myDuration.inSeconds.remainder(60));

  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 5);

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(days: 5));
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
            heightFactor: 0.5,
            widthFactor: 1.0,
            child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                color: Colors.blue,
                child: Column(children: [
                  Expanded(flex: 65, child: Container(color: Colors.red)),
                  Expanded(flex: 35, child: Container(color: Colors.purple)),
                ]))),
      ),
    );
  }
}

class PomodoroScreen extends StatelessWidget {
  late final BaseClass baseScreen;
  PomodoroScreen({required List<Widget> managerContainer, super.key}) {
    baseScreen = BaseClass(
      widgetContainer: const [PomodoroTimer()],
      managerContainer: managerContainer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return baseScreen;
  }
}
