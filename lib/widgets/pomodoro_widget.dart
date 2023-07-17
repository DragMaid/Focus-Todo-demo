import 'package:flutter/material.dart';
import 'dart:async';

class TimerSlider extends StatefulWidget {
  final Function(int) updateFunc;
  const TimerSlider({required this.updateFunc, super.key});
  @override
  State<TimerSlider> createState() => _TimerSliderState();
}

class _TimerSliderState extends State<TimerSlider> {
  final double _maxValue = 120;
  final double _minValue = 5;
  final int _gapValue = 5;
  double _currentValue = 45;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
          trackHeight: 20,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15)),
      child: Slider(
          value: _currentValue,
          min: _minValue,
          max: _maxValue,
          activeColor: const Color.fromRGBO(255, 156, 108, 0.7),
          thumbColor: const Color.fromRGBO(255, 156, 108, 1),
          divisions: (_maxValue / _gapValue).round(),
          label: _currentValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentValue = value;
              widget.updateFunc(value.round());
            });
          }),
    );
  }
}

class CustomButton extends StatefulWidget {
  final double width;
  final double height;
  final Function func;
  static bool _isPressed = false;
  const CustomButton(
      {required this.width,
      required this.height,
      required this.func,
      super.key});

  void toggleState() {
    _isPressed = !_isPressed;
  }

  bool getState() {
    return _isPressed;
  }

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final double buttonGap = 10;
  static double decrement = 0;

  @override
  Widget build(BuildContext context) {
    String buttonText = widget.getState() ? "PAUSE" : "START";
    return SizedBox(
        height: widget.height,
        width: widget.width,
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: buttonGap,
                      color: const Color(0xFFffcc99),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: decrement),
                    height: widget.height - buttonGap,
                    color: const Color(0xFFffffcc),
                    child: Center(
                        child: Text(buttonText,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 30))),
                  ),
                ],
              ),
              GestureDetector(onTap: () {
                setState(() {
                  if (!widget.getState()) {
                    widget.func();
                    decrement = buttonGap;
                  } else {
                    widget.func();
                    decrement = 0;
                  }
                  widget.toggleState();
                });
              }),
            ],
          ),
        ));
  }
}

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({super.key});
  @override
  State<PomodoroTimer> createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  bool isOn = false;

  Timer? countdownTimer;
  List<int> defaultDuration = [0, 45, 0];
  late Duration currentDuration = Duration(
    hours: defaultDuration[0],
    minutes: defaultDuration[1],
    seconds: defaultDuration[2],
  );

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

  void updateTimer(int minutes) {
    defaultDuration = [0, minutes, 0];
    resetTimer();
  }

  void resetTimer() {
    if (isOn) {
      stopTimer();
    }
    setState(() {
      currentDuration = Duration(
        hours: defaultDuration[0],
        minutes: defaultDuration[1],
        seconds: defaultDuration[2],
      );
    });
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = currentDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        currentDuration = Duration(seconds: seconds);
      }
    });
  }

  void clockToggle() {
    if (!isOn) {
      startTimer();
    } else {
      stopTimer();
    }
    isOn = !isOn;
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(currentDuration.inHours.remainder(24));
    final minutes = strDigits(currentDuration.inMinutes.remainder(60));
    final seconds = strDigits(currentDuration.inSeconds.remainder(60));
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 244, 232, 1),
      body: Center(
        child: FractionallySizedBox(
            heightFactor: 0.5,
            widthFactor: 1.0,
            child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                color: const Color.fromRGBO(254, 231, 212, 1),
                child: Column(children: [
                  Expanded(
                      flex: 60,
                      child: Stack(children: [
                        Center(
                            child: Text("$hours:$minutes:$seconds",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(251, 126, 70, 1),
                                    fontSize: 50))),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 10,
                            margin: const EdgeInsets.only(
                                bottom: 20, right: 20, left: 20),
                            child: Opacity(
                                opacity: !isOn ? 1.0 : 0.5,
                                child: AbsorbPointer(
                                  absorbing: isOn,
                                  child: TimerSlider(updateFunc: updateTimer),
                                )),
                          ),
                        ),
                      ])),
                  Expanded(
                      flex: 40,
                      child: Center(
                          child: CustomButton(
                              width: 200,
                              height: 75,
                              func: () {
                                clockToggle();
                              }))),
                ]))),
      ),
    );
  }
}
