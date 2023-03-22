import 'package:calorie_tracker/ui/view/widgets/home/circle_progress_indicator.dart';
import 'package:calorie_tracker/ui/view/widgets/home/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: 'Home', isProfile: true, appBar: AppBar()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleProgressBar(),
        ],
      ),
    );
  }
}
