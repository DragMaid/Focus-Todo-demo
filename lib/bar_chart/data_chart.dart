import 'package:focus_todo/bar_chart/individual.dart';

class DataBar {
  final double sunday;
  final double monday;
  final double tuesday;
  final double webnesday;
  final double thursday;
  final double friday;
  final double saturday;

  DataBar({
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.webnesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  List<IndividulBar> bardata = [];

  void initialBarDate() {
    bardata = [
      IndividulBar(x: 0, y: monday),
      IndividulBar(x: 1, y: tuesday),
      IndividulBar(x: 2, y: webnesday),
      IndividulBar(x: 3, y: thursday),
      IndividulBar(x: 4, y: friday),
      IndividulBar(x: 5, y: saturday),
      IndividulBar(x: 6, y: sunday),
    ];
  }
}
