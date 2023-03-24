import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../providers/bmi_provider.dart';

class LineChart extends StatefulWidget {
  const LineChart({super.key});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  late List<Salesdata> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BmiProvider bmiInformation = Provider.of<BmiProvider>(context);

    double calculateBmi = bmiInformation.getWeight /
        (bmiInformation.getHeight * bmiInformation.getHeight / 10000);

    return Center(
      child: SizedBox(
        height: 250,
        width: 300,
        child: SfCartesianChart(
          title: ChartTitle(
              text: "BMI Tracer", textStyle: TextStyle(color: bgOrange)),
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

List<Salesdata> getChartData() {
  final List<Salesdata> chartData = [
    Salesdata(18, 2019),
    Salesdata(22, 2020),
    Salesdata(20, 2021),
    Salesdata(25, 2022),
    Salesdata(21, 2023),
  ];
  return chartData;
}

class Salesdata {
  final double value;
  final double date;
  Salesdata(this.value, this.date);
}
