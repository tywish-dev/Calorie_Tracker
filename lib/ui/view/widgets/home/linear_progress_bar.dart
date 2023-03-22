import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar(
      {super.key,
      required this.color,
      required this.label,
      required this.percent});
  final Color color;
  final String label;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearPercentIndicator(
          width: 100.0,
          lineHeight: 8.0,
          percent: percent,
          barRadius: const Radius.circular(20),
          progressColor: color,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "${Faker().randomGenerator.integer(200, min: 20).toString()}g left",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }
}
