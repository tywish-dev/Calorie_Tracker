import 'package:flutter/material.dart';

import '../../screens/meal_screen.dart';

class MealTimeCard extends StatelessWidget {
  const MealTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.only(top: 33, right: 5, left: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MealScreen(
                            mealName: "Breakfast",
                            kcal: 30,
                            kcalCarb: 40,
                            kcalPro: 50,
                            kcalFat: 50)));
              },
              child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Breakfast",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MealScreen(
                            mealName: "Lunch",
                            kcal: 30,
                            kcalCarb: 40,
                            kcalPro: 50,
                            kcalFat: 50)));
              },
              child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Lunch",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 5,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Dinner",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 5,
            ),
          ],
        ),
      ),
    );
  }
}
