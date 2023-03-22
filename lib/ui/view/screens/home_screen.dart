import 'package:flutter/material.dart';

import '../widgets/home/bottom_nav_bar.dart';
import '../widgets/home/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: 'Home', isProfile: true, appBar: AppBar()),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.amber,
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
