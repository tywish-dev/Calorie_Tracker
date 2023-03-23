import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/view/screens/home_screen.dart';
import 'package:calorie_tracker/ui/view/screens/register_user_detail_screen.dart';
import 'package:calorie_tracker/ui/view/widgets/login/custom_button.dart';
import 'package:calorie_tracker/ui/view/widgets/login/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _mailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: bgOrange,
        body: SafeArea(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                color: bgGreen.withOpacity(.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                Center(
                  child: Image.asset(
                    "assets/logo.png",
                    width: 200,
                    height: 200,
                  ),
                ),
                CustomTextField(
                    controller: _mailController,
                    label: "Email",
                    obscureText: false),
                CustomTextField(
                    controller: _passwordController,
                    label: "Password",
                    obscureText: true),
                CustomButton(
                    text: "Sign in",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }, bgColor: false,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't you have account",
                      style: TextStyle(color: bgOrange, fontSize: 12),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: bgWhite, fontSize: 16),
                        )),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
