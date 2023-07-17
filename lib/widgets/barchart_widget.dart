import 'package:focus_todo/bar_chart/chart_page.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(254, 231, 212, 1),
        body: RotatedBox(quarterTurns: -3, child: Chartpage()));
  }
}
