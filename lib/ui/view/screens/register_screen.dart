import 'package:calorie_tracker/data/models/user_auth_model.dart';
import 'package:calorie_tracker/data/models/user_model.dart';
import 'package:calorie_tracker/ui/providers/user_auth_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
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
  late TextEditingController _mailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  @override
  void initState() {
    _mailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserAuthProvider userAuthProvider = Provider.of<UserAuthProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
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
                  onPressed: () async {
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(
                            child: Text(
                              'Wrong password!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ),
                        ),
                      );
                    } else if (_passwordController.text == "" ||
                        _confirmPasswordController.text == "" ||
                        _mailController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(
                            child: Text(
                              'Check Fields!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ),
                        ),
                      );
                    } else {
                      await userAuthProvider.signUp(
                          UserAuthModel(
                              email: _mailController.text,
                              password: _passwordController.text,
                              returnSecureToken: true),
                          userAuthProvider.user!);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterUserDetail()));
                    }
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
