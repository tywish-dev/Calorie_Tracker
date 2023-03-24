import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/view/screens/nutritionFacts.dart';

import '/data/models/nutrition_model.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.nutrition});
  final Nutrition nutrition;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NutritionFacts(
              nutrition: nutrition,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: bgOrange,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 22,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${nutrition.name[0].toUpperCase()}${nutrition.name.substring(1).toLowerCase()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${nutrition.calories} Calories, ${nutrition.serving_size_g.toInt()} gr",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black54),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
