import '/ui/view/screens/register_user_detail_screen.dart';
import '/data/constants/constants.dart';
import '/ui/view/widgets/login/custom_button.dart';
import '/ui/view/widgets/login/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _mailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .6,
            width: MediaQuery.of(context).size.width * .8,
            decoration: BoxDecoration(
              color: bgGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                    controller: _mailController,
                    label: "Email",
                    obscureText: false),
                CustomTextField(
                    controller: _passwordController,
                    label: "Password",
                    obscureText: true),
                CustomTextField(
                    controller: _confirmPasswordController,
                    label: "Confirm Password",
                    obscureText: true),
                CustomButton(
                  text: "Sign up",
                  onPressed: () {
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Center(
                              child: Text(
                        'Wrong password!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ))));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterUserDetail()));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
