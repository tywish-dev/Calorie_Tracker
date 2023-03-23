import 'package:calorie_tracker/ui/view/screens/main_screen.dart';

import '/ui/providers/user_auth_provider.dart';
import 'package:provider/provider.dart';
import '../../../data/models/user_auth_model.dart';
import '../../providers/user_provider.dart';
import '/data/constants/constants.dart';
import '/ui/view/screens/home_screen.dart';
import '/ui/view/widgets/login/custom_button.dart';
import '/ui/view/widgets/login/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _mailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _mailController = TextEditingController(text: "samettt@gmail.com");
    _passwordController = TextEditingController(text: "asdqweasd");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserAuthProvider userAuthProvider = Provider.of<UserAuthProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      color: bgOrange,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 100),
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
                  const SizedBox(
                    height: 200,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        controller: _mailController,
                        label: "Email",
                        obscureText: false,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        label: "Password",
                        obscureText: true,
                      ),
                      CustomButton(
                        text: "Sign in",
                        onPressed: () async {
                          if (_passwordController.text == "" ||
                              _mailController.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Center(
                                  child: Text(
                                    'Check Fields!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            try {
                              await userAuthProvider.signInWithPassword(
                                UserAuthModel(
                                    email: _mailController.text,
                                    password: _passwordController.text,
                                    returnSecureToken: true),
                                userProvider.user,
                              );
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()));
                            } catch (e) {
                              print(e.toString());
                            }
                          }
                        },
                        bgColor: false,
                      ),
                    ],
                  ),
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
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
