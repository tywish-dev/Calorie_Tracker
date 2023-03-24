import '/data/models/nutrition_model.dart';
import '/ui/view/widgets/Nutrition%20Facts/mealDetails.dart';
import '/ui/view/widgets/Nutrition%20Facts/mealInformation.dart';
import 'package:flutter/material.dart';
import '../../../data/constants/constants.dart';

class NutritionFacts extends StatelessWidget {
  const NutritionFacts({super.key, required this.nutrition});
  final Nutrition nutrition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .8,
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(
              color: bgWhite,
              border: Border.all(color: Colors.black, width: 2)),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black54))),
                child: const Text(
                  "Nutrition Facts",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width * .7,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 10, color: Colors.black54))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${nutrition.name[0].toUpperCase()}${nutrition.name.substring(1).toLowerCase()}",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "(${nutrition.serving_size_g.toInt()})",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width * .7,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 5, color: Colors.black54))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Calories",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "${nutrition.calories.toInt()}",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width * .7,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black54, width: 1))),
                child: Row(
                  children: const [
                    Spacer(),
                    Text(
                      "% Daily Value*",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              MealInformation(
                  mealName: "Total Fat",
                  mealgr: "${nutrition.fat_total_g}",
                  percentage:
                      "${(nutrition.serving_size_g / nutrition.fat_total_g) ~/ 30}"),
              MealDetails(
                  mealName: "Satured Fat",
                  mealgr: "${nutrition.fat_saturated_g}",
                  percentage: nutrition.fat_saturated_g == 0
                      ? "0"
                      : "${(nutrition.serving_size_g / nutrition.fat_saturated_g) ~/ 30}"),
              MealInformation(
                  mealName: "Cholesterol",
                  mealgr: "${nutrition.cholesterol_mg}",
                  percentage: nutrition.cholesterol_mg == 0
                      ? "0"
                      : "${(nutrition.serving_size_g / nutrition.cholesterol_mg) ~/ 30}"),
              MealInformation(
                  mealName: "Sodium",
                  mealgr: "${nutrition.sodium_mg}",
                  percentage: nutrition.sodium_mg == 0
                      ? "0"
                      : "${(nutrition.serving_size_g / nutrition.sodium_mg) ~/ 30}"),
              MealInformation(
                  mealName: "Total Carbohydrate",
                  mealgr: "${nutrition.carbohydrates_total_g}",
                  percentage: nutrition.carbohydrates_total_g == 0
                      ? "0"
                      : "${(nutrition.serving_size_g / nutrition.carbohydrates_total_g) ~/ 30}"),
              MealDetails(
                  mealName: "Dietary Fiber",
                  mealgr: "${nutrition.fiber_g}",
                  percentage: nutrition.fiber_g == 0
                      ? "0"
                      : "${(nutrition.serving_size_g / nutrition.fiber_g) ~/ 30}"),
              MealDetails(
                  mealName: "Total Sugars",
                  mealgr: "${nutrition.sugar_g}",
                  percentage: nutrition.sugar_g == 0
                      ? "0"
                      : "${(nutrition.serving_size_g / nutrition.sugar_g) ~/ 30}"),
              MealInformation(
                  mealName: "Protein",
                  mealgr: "${nutrition.protein_g}",
                  percentage: nutrition.protein_g == 0
                      ? "0"
                      : "${(nutrition.serving_size_g / nutrition.protein_g) ~/ 30}"),
            ],
          ),
        ),
      ),
    ));
  }
}
