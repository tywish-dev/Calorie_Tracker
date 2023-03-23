import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:calorie_tracker/ui/view/screens/home_page_screen.dart';
import 'package:calorie_tracker/ui/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: AnimatedSplashScreen.withScreenFunction(
        backgroundColor: Colors.orange,
        curve: Curves.easeOut,
        splash: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/splashAnimation/splash_animation.gif'),
        ),
        duration: 2000,
        screenFunction: () async {
          //datalar çekilecek
          return HomeScreen();
        },
      ),
    );
  }
}
