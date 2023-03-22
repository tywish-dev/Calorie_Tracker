// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String mealTitle;
  final String foodName;
  final String foodCalorie;
  const CardView({
    Key? key,
    this.mealTitle = "Breakfast",
    this.foodName = "Hotdog",
    this.foodCalorie = "150 / 450 Kcal",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.red,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 110,
                      child: Image.network(
                        Faker().image.image(
                          keywords: ["$foodName", "food"],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
