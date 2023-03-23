import 'package:calorie_tracker/ui/providers/page_provider.dart';
import 'package:calorie_tracker/ui/view/screens/nutritionFacts.dart';
import '/ui/view/screens/food_search.dart';
import '/ui/view/screens/recipe_screen.dart';
import '/ui/view/screens/splash_screen.dart';
import '/ui/providers/nutrition_provider.dart';
import '/ui/providers/recipe_provider.dart';
import '/ui/providers/user_auth_provider.dart';
import '/ui/providers/user_provider.dart';
import '/data/constants/constants.dart';
import '/ui/providers/bmi_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'ui/view/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ListenableProvider(create: (_) => BmiProvider()),
      ListenableProvider(create: (_) => NutritionProvider()),
      ListenableProvider(create: (_) => UserAuthProvider()),
      ListenableProvider(create: (_) => RecipeProvider()),
      ListenableProvider(create: (_) => UserProvider()),
      ListenableProvider(create: (_) => PageProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        disabledColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
