import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/view/widgets/login/custom_button.dart';
import 'package:calorie_tracker/ui/view/widgets/login/custom_text_field.dart';
import 'package:flutter/material.dart';

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
                color: bgGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                CustomTextField(
                    controller: _mailController,
                    label: "Email",
                    obscureText: false),
                CustomTextField(
                    controller: _passwordController,
                    label: "Password",
                    obscureText: true),
                CustomButton(text: "Sign in", onPressed: () {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {}, child: Text("Sign up"))
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
