import 'package:focus_todo/barchart.dart';
import 'package:focus_todo/chart_container.dart';
import 'package:flutter/material.dart';

class BarWidget extends StatefulWidget {
  const BarWidget({Key? key}) : super(key: key);

  @override
  State<BarWidget> createState() => _BarWidgetState();
}

class _BarWidgetState extends State<BarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xfff0f0f0),
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
        children: <Widget>[
          ChartContainer(
              title: 'Bar Chart',
              color: Color(0xfffc5185),
              chart: BarChartContent()),
        ],
      ),
    ));
  }
}
