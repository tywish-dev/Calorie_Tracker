import 'package:calorie_tracker/ui/view/screens/splash_screen.dart';
import 'package:calorie_tracker/ui/view/widgets/home/daily_card_view.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/home/circle_progress_bar.dart';
import '../widgets/home/linear_progress_bar.dart';
import '../widgets/home/text_with_icon.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
        CardView(),
      ],
    );
  }
}
