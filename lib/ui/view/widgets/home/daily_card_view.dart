// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calorie_tracker/ui/providers/user_auth_provider.dart';
import 'package:calorie_tracker/ui/view/screens/meal_screen.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    UserAuthProvider userAuthProvider = Provider.of<UserAuthProvider>(context);
    return GestureDetector(
      onTap: () async {
        await userAuthProvider.getNutritionByCategory(
            userAuthProvider.user!.localId!,
            howMeal == "0"
                ? "Breakfast"
                : howMeal == "1"
                    ? "Lunch"
                    : howMeal == "2"
                        ? "Dinner"
                        : "");
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            if (howMeal == "0") {
              return const MealScreen(
                  mealName: "Breakfast",
                  kcal: 30,
                  kcalCarb: 40,
                  kcalPro: 50,
                  kcalFat: 50);
            } else if (howMeal == "1") {
              return const MealScreen(
                  mealName: "Lunch",
                  kcal: 30,
                  kcalCarb: 40,
                  kcalPro: 50,
                  kcalFat: 50);
            } else if (howMeal == "2") {
              return const MealScreen(
                  mealName: "Dinner",
                  kcal: 30,
                  kcalCarb: 40,
                  kcalPro: 50,
                  kcalFat: 50);
            } else {
              return Container();
            }
          }),
        );
      },
      child: Center(
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
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
                        userAuthProvider.nList![0].name!,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          foodCalorie,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Stack(children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10),
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
