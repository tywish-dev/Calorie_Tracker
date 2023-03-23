import 'package:calorie_tracker/ui/view/widgets/profile/bmi_card.dart';
import 'package:calorie_tracker/ui/view/widgets/profile/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileAvatar(),
            SizedBox(
              height: 40,
            ),
            BmiCard(),
          ],
        ),
      ),
    );
  }
}
