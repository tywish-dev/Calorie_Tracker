// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/data/models/nutrition_model.dart';
import 'package:calorie_tracker/data/services/user_auth.dart';
import 'package:calorie_tracker/ui/providers/user_auth_provider.dart';
import 'package:calorie_tracker/ui/view/widgets/home/circle_progress_bar.dart';
import 'package:calorie_tracker/ui/view/widgets/home/custom_app_bar.dart';
import 'package:calorie_tracker/ui/view/widgets/meal/food_card.dart';
import 'package:calorie_tracker/ui/view/widgets/meal/small_circle_progress_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealScreen extends StatelessWidget {
  final String mealName;
  final int kcal;
  final int kcalCarb;
  final int kcalPro;
  final int kcalFat;

  const MealScreen({
    Key? key,
    required this.mealName,
    required this.kcal,
    required this.kcalCarb,
    required this.kcalPro,
    required this.kcalFat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAuthProvider userAuthProvider = Provider.of<UserAuthProvider>(context);

    return Scaffold(
      backgroundColor: bgGreen,
      appBar: CustomAppBar(label: "", isProfile: false, appBar: AppBar()),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            Text(
              mealName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Recommended portion : $kcal kcal",
              style: const TextStyle(color: Colors.black54),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  const CircleProgressBar(),
                  Column(
                    children: const [
                      SmallCircleProgressBar(
                          color: Colors.green,
                          value: 30,
                          precent: .9,
                          text: "CARB"),
                      SmallCircleProgressBar(
                          color: Colors.purple,
                          value: 50,
                          precent: .7,
                          text: "PROTEIN"),
                      SmallCircleProgressBar(
                          color: Colors.blue,
                          value: 40,
                          precent: .8,
                          text: "FAT"),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
        const Spacer(),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 450,
            decoration: const BoxDecoration(
                color: bgWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15,
                      offset: Offset(0, .8))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Food",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      child: Consumer<UserAuthProvider>(
                    builder: (context, userAuthProvider, _) => ListView(
                      children: [
                        ...userAuthProvider.nList!
                            .map((e) => GestureDetector(
                                  onLongPress: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:
                                              Text("Want to delete ${e.name}"),
                                          actions: [
                                            SizedBox(
                                              width: 150,
                                              child: OutlinedButton(
                                                onPressed: () async {
                                                  userAuthProvider
                                                      .deleteNutritionbyId(
                                                          userAuthProvider
                                                              .user!.localId!,
                                                          mealName,
                                                          e);
                                                },
                                                child: const Text("Delete"),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: FoodCard(
                                      // image: Faker().image.image(
                                      //     keywords: ["${e.name}"],
                                      //     height: 50,
                                      //     width: 50,
                                      //     random: true),
                                      foodName: e.name!,
                                      kcal: e.calories!.toInt(),
                                      // piece: e.serving_size_g!.toInt(),
                                      gr: e.serving_size_g!.toInt()),
                                ))
                            .toList(),
                      ],
                    ),
                  )),
                ],
              ),
            ))
      ]),
    );
  }
}
