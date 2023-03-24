import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/providers/user_provider.dart';
import 'package:calorie_tracker/ui/view/widgets/profile/line_chart.dart';
import 'package:calorie_tracker/ui/view/widgets/profile/profile_avatar.dart';
import 'package:calorie_tracker/ui/view/widgets/profile/user_information_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/bmi_provider.dart';
import '../widgets/home/bottom_nav_bar.dart';
import '/ui/providers/user_provider.dart';
import '/ui/view/widgets/profile/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    BmiProvider bmiInformation = Provider.of<BmiProvider>(context);
    double calculateBmi = bmiInformation.getWeight /
        (bmiInformation.getHeight * bmiInformation.getHeight / 10000);
    return Scaffold(
      backgroundColor: bgGreen,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: ProfileAvatar(),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              userProvider.user.localId,
              style: const TextStyle(color: Colors.black),
            ),
            LineChart(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserCard(
                    text: "BMI",
                    value: "${calculateBmi.toStringAsFixed(2)}",
                  ),
                  UserCard(
                    text: "Age",
                    value: bmiInformation.getAge.toString(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserCard(
                      text: "Height",
                      value: bmiInformation.getHeight.toString()),
                  UserCard(
                      text: "Weight",
                      value: bmiInformation.getWeight.toString())
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
