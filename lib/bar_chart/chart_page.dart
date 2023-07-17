import 'package:flutter/material.dart';
import 'package:focus_todo/bar_chart/bar_graph.dart';

class Chartpage extends StatefulWidget {
  const Chartpage({super.key});
  @override
  State<Chartpage> createState() => _ChartPageState();
}

class _ChartPageState extends State<Chartpage> {
  List<double> weeklySummery = [
    10,
    4,
    20,
    8,
    19,
    1,
    24,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 231, 212, 1),
      body: SizedBox(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.height - 80,
          child: Container(
              padding: const EdgeInsets.only(left: 40),
              child: Center(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                      child: GraphBar(
                        weeklySummery: weeklySummery,
                      ))))),
    );
  }
}
