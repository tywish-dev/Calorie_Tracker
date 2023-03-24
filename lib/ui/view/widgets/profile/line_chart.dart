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
    return Center(
        child: SizedBox(
            height: 250,
            width: 300,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(
                    text: 'BMI Tracker', textStyle: TextStyle(color: bgOrange)),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip

                series: <LineSeries<Salesdata, String>>[
                  LineSeries<Salesdata, String>(
                      color: bgOrange,
                      dataSource: <Salesdata>[
                        Salesdata("No", 18),
                        Salesdata("De", 30),
                        Salesdata("Je", 22),
                        Salesdata("Fe", 19),
                        Salesdata("Ma", double.parse(bmi.toStringAsFixed(2))),
                      ],
                      xValueMapper: (Salesdata sales, _) => sales.value,
                      yValueMapper: (Salesdata sales, _) => sales.date,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ])));
  }
}

class Salesdata {
  final String value;
  final double date;
  Salesdata(this.value, this.date);
}
