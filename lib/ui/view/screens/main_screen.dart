import 'package:calorie_tracker/ui/providers/page_provider.dart';
import 'package:calorie_tracker/ui/view/screens/food_search.dart';
import 'package:calorie_tracker/ui/view/screens/home_screen.dart';
import 'package:calorie_tracker/ui/view/screens/profile_screen.dart';
import 'package:calorie_tracker/ui/view/widgets/home/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeScreen(),
      HomeScreen(),
      FoodSearch(),
      ProfileScreen()
    ];
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return Scaffold(
      body: pages[pageProvider.page],
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
