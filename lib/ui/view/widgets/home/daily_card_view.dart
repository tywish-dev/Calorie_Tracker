// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/view/screens/meal_screen.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String mealTitle;
  final String foodName;
  final String foodCalorie;
  final String howMeal;
  const CardView({
    Key? key,
    required this.mealTitle,
    required this.foodName,
    required this.foodCalorie,
    required this.howMeal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          if (howMeal == "0") {
            return MealScreen(
                mealName: "Breakfast",
                kcal: 30,
                kcalCarb: 40,
                kcalPro: 50,
                kcalFat: 50);
          } else if (howMeal == "1") {
            return MealScreen(
                mealName: "Lunch",
                kcal: 30,
                kcalCarb: 40,
                kcalPro: 50,
                kcalFat: 50);
          } else if (howMeal == "2") {
            return MealScreen(
                mealName: "Dinner",
                kcal: 30,
                kcalCarb: 40,
                kcalPro: 50,
                kcalFat: 50);
          } else {
            return Container();
          }
        }),
      ),
      child: Center(
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: bgOrange,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: SizedBox(
            width: 350,
            height: 140,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mealTitle,
                        style: TextStyle(
                          color: Colors.orange[800],
                        ),
                      ),
                      Text(
                        foodName,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          foodCalorie,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Stack(children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.white70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                Faker().image.image(
                                  keywords: ["$foodName", "food"],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
