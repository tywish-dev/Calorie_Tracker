import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/providers/user_provider.dart';
import 'package:calorie_tracker/ui/view/widgets/profile/line_chart.dart';
import 'package:calorie_tracker/ui/view/widgets/profile/profile_avatar.dart';
import 'package:calorie_tracker/ui/view/widgets/profile/user_information_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/bmi_provider.dart';
import '../../providers/user_auth_provider.dart';
import '../widgets/home/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserAuthProvider userProvider = Provider.of<UserAuthProvider>(context);
    BmiProvider bmiInformation = Provider.of<BmiProvider>(context);
    double calculateBmi = bmiInformation.getWeight /
        (bmiInformation.getHeight * bmiInformation.getHeight / 10000);
    return Scaffold(
      backgroundColor: bgGreen,
      body: SafeArea(
        child: Column(
          children: [
            const ProfileAvatar(),
            const SizedBox(
              height: 40,
            ),
            Text(
              userProvider.user!.name!,
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
