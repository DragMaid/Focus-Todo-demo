import 'package:fl_chart/fl_chart.dart';
import 'package:focus_todo/barchart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BarChartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
      maxY: 16,
      barGroups: barChartGroupData,
    ));
  }
}
