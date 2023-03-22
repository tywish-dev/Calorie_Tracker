import 'package:calorie_tracker/ui/view/widgets/home/custom_app_bar.dart';
import 'package:calorie_tracker/ui/view/widgets/home/linear_progress_bar.dart';
import 'package:calorie_tracker/ui/view/widgets/home/text_with_icon.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../widgets/home/circle_progress_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: 'Home', isProfile: true, appBar: AppBar()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                child: TextWithIcon(
                  label: "Eaten",
                  num: Faker().randomGenerator.integer(500, min: 30).toString(),
                  icon: const Icon(Icons.local_dining),
                ),
              ),
              const CircleProgressBar(),
              SizedBox(
                width: 100,
                child: TextWithIcon(
                  label: "Burned",
                  num: Faker().randomGenerator.integer(500, min: 30).toString(),
                  icon: const Icon(Icons.local_fire_department),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LinearProgressBar(
                color: Colors.green,
                label: "CARB",
                percent: 0.3,
              ),
              LinearProgressBar(
                label: "PROTEIN",
                color: Colors.pink.shade900,
                percent: 0.5,
              ),
              LinearProgressBar(
                label: "FAT",
                color: Colors.blue.shade800,
                percent: 0.8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
