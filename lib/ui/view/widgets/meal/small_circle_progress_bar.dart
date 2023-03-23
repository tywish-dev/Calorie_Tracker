// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SmallCircleProgressBar extends StatelessWidget {
  final Color color;
  final int value;
  final double precent;
  final String text;
  const SmallCircleProgressBar({
    Key? key,
    required this.color,
    required this.value,
    required this.precent,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, top: 20),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 20.0,
            lineWidth: 4.0,
            percent: precent,
            progressColor: color,
            backgroundColor: bgGreen,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Text(
                  "${value}g",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  text,
                  style: const TextStyle(fontSize: 10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
