import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../providers/user_auth_provider.dart';

class LineChart extends StatefulWidget {
  const LineChart({super.key});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  late List<Salesdata> _chartData;

  @override
  Widget build(BuildContext context) {
    UserAuthProvider userProvider = Provider.of<UserAuthProvider>(context);
    double bmi = userProvider.user!.weight! /
        ((userProvider.user!.height! * userProvider.user!.height!) / 10000);
    _chartData = getChartData(bmi);
    return Center(
      child: SizedBox(
        height: 250,
        width: 300,
        child: SfCartesianChart(
          title: ChartTitle(
              text: "BMI Tracer", textStyle: const TextStyle(color: bgOrange)),
          plotAreaBackgroundColor: bgGreen,
          series: <ChartSeries>[
            LineSeries<Salesdata, double>(
              color: bgOrange,
              dataSource: _chartData,
              xValueMapper: (Salesdata sales, _) => sales.date,
              yValueMapper: (Salesdata sales, _) => sales.value,
            )
          ],
        ),
      ),
    );
  }
}

List<Salesdata> getChartData(double bmi) {
  final List<Salesdata> chartData = [
    Salesdata(18, 2019),
    Salesdata(22, 2020),
    Salesdata(20, 2021),
    Salesdata(25, 2022),
    Salesdata(bmi, 2023),
  ];
  return chartData;
}

class Salesdata {
  final double value;
  final double date;
  Salesdata(this.value, this.date);
}
