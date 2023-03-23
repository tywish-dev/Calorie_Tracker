import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MealTimeCard extends StatelessWidget {
  const MealTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                children: [
                  Text(
                    "KAHVALTI",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 5,
            ),
            Container(
              height: 40,
              color: bgOrange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ÖĞLE YEMEĞİ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 5,
            ),
            Container(
              height: 40,
              color: bgOrange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AKŞAM YEMEĞİ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 5,
            ),
          ],
        ),
      ),
    );
  }
}
