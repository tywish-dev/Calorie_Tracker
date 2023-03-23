import 'package:calorie_tracker/ui/view/widgets/Nutrition%20Facts/mealDetails.dart';
import 'package:calorie_tracker/ui/view/widgets/Nutrition%20Facts/mealInformation.dart';
import 'package:flutter/material.dart';

import '../../../data/constants/constants.dart';

class NutritionFacts extends StatelessWidget {
  const NutritionFacts({super.key});

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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tomato",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "(55g)",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Calories",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "230",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                child: const Row(
                  children: [
                    Spacer(),
                    Text(
                      "% Daily Value*",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const MealInformation(
                  mealName: "Total Fat", mealgr: "8", percentage: "10"),
              const MealDetails(
                  mealName: "Satured Fat", mealgr: "1", percentage: "10"),
              const MealDetails(
                  mealName: "Trans Fat", mealgr: "0", percentage: "5"),
              const MealInformation(
                  mealName: "Cholesterol", mealgr: "0", percentage: "0"),
              const MealInformation(
                  mealName: "Sodium", mealgr: "1.6", percentage: "8"),
              const MealInformation(
                  mealName: "Total Carbohydrate",
                  mealgr: "37",
                  percentage: "13"),
              const MealDetails(
                  mealName: "Dietary Fiber", mealgr: "4", percentage: "14"),
              const MealDetails(
                  mealName: "Total Sugars", mealgr: "12", percentage: ""),
              const MealInformation(
                  mealName: "Protein", mealgr: "3", percentage: ""),
            ],
          ),
        ),
      ),
    ));
  }
}
