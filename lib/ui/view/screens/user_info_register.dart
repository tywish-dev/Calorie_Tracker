import 'package:calorie_tracker/data/models/user_auth_model.dart';
import 'package:calorie_tracker/data/models/user_model.dart';
import 'package:calorie_tracker/ui/providers/user_auth_provider.dart';
import 'package:calorie_tracker/ui/view/screens/register_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '/ui/view/screens/register_user_detail_screen.dart';
import '/data/constants/constants.dart';
import '/ui/view/widgets/login/custom_button.dart';
import '/ui/view/widgets/login/custom_text_field.dart';
import 'package:flutter/material.dart';

class UserInfoRegister extends StatefulWidget {
  const UserInfoRegister({super.key});

  @override
  State<UserInfoRegister> createState() => _UserInfoRegister();
}

class _UserInfoRegister extends State<UserInfoRegister> {
  late TextEditingController _userNameController;
  late TextEditingController _userSurnameController;
  late TextEditingController _targetCalorieController;
  @override
  void initState() {
    _userNameController = TextEditingController();
    _userSurnameController = TextEditingController();
    _targetCalorieController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserAuthProvider userAuthProvider = Provider.of<UserAuthProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
              color: bgOrange,
              borderRadius: BorderRadius.vertical(
                bottom:
                    Radius.elliptical(MediaQuery.of(context).size.width, 100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/splashAnimation/splash_animation.gif',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 180,
                ),
                CustomTextField(
                    controller: _userNameController,
                    label: "Name",
                    obscureText: false),
                CustomTextField(
                    controller: _userSurnameController,
                    label: "Surname",
                    obscureText: false),
                CustomTextField(
                    controller: _targetCalorieController,
                    label: "Target Calorie",
                    obscureText: false),
                CustomButton(
                  text: "Next",
                  onPressed: () async {
                    // User modele veri yollanacak
                    userAuthProvider.user!.name =
                        "${_userNameController.text} ${_userSurnameController.text}";
                    userAuthProvider.user!.targetCalorie =
                        int.parse(_targetCalorieController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterUserDetail()));
                  },
                  bgColor: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
