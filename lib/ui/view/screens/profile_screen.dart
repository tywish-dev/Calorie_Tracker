import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/view/widgets/profile/line_chart.dart';
import 'package:calorie_tracker/ui/view/widgets/profile/profile_avatar.dart';
import 'package:calorie_tracker/ui/view/widgets/profile/user_information_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserAuthProvider userProvider = Provider.of<UserAuthProvider>(context);

    var bmi = userProvider.user!.weight! /
        ((userProvider.user!.height! * userProvider.user!.height!) / 10000);

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
              userProvider.user!.name!,
              style: const TextStyle(color: Colors.black),
            ),
            const LineChart(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserCard(
                    text: "BMI",
                    value: bmi.toStringAsFixed(2),
                  ),
                  UserCard(
                    text: "Age",
                    value: userProvider.user!.age.toString(),
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
                      value: userProvider.user!.height.toString()),
                  UserCard(
                      text: "Weight",
                      value: userProvider.user!.weight.toString())
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
