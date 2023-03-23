import '/ui/providers/user_provider.dart';
import '/ui/view/widgets/profile/bmi_card.dart';
import '/ui/view/widgets/profile/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileAvatar(),
            const SizedBox(
              height: 40,
            ),
            Text(
              userProvider.user.localId,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            const BmiCard(),
          ],
        ),
      ),
    );
  }
}
