import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/view/screens/home_page_screen.dart';
import 'package:calorie_tracker/ui/view/screens/splash_screen.dart';
import '/ui/providers/bmi_provider.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/ui/view/screens/home_screen.dart';
import '/ui/view/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ListenableProvider(create: (_) => BmiProvider()),
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
        scaffoldBackgroundColor: bgOrange,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        disabledColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
