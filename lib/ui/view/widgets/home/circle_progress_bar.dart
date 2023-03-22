import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleProgressBar extends StatelessWidget {
  const CircleProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularPercentIndicator(
          radius: 100.0,
          lineWidth: 20.0,
          percent: 0.8,
          progressColor: Colors.orange,
          backgroundColor: Colors.black12,
          animation: true,
          animationDuration: 2000,
        ),
        Material(
          elevation: 10,
          shape: const CircleBorder(),
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.bolt,
                  color: Colors.orange,
                  size: 36,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  Faker().randomGenerator.integer(3000, min: 1900).toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'KCAL LEFT',
                  style:
                      TextStyle(letterSpacing: 2, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
