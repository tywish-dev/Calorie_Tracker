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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 33),
            child: Container(
              height: 40,
              color: bgOrange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ÖĞÜNLER"),
                ],
              ),
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
                Text("ÖĞÜNLER"),
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
                Text("ÖĞÜNLER"),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 5,
          ),
        ],
      ),
    );
  }
}
