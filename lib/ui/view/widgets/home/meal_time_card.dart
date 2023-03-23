import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:flutter/material.dart';

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
            Container(
              height: 40,
              color: bgOrange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Breakfast",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 5,
            ),
            Container(
              height: 40,
              color: bgOrange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Lunch",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 5,
            ),
            Container(
              height: 40,
              color: bgOrange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Dinner",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 5,
            ),
          ],
        ),
      ),
    );
  }
}
