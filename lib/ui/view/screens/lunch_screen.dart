import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/view/widgets/home/circle_progress_bar.dart';
import 'package:calorie_tracker/ui/view/widgets/home/custom_app_bar.dart';
import 'package:calorie_tracker/ui/view/widgets/meal/food_card.dart';
import 'package:calorie_tracker/ui/view/widgets/meal/small_circle_progress_bar.dart';
import 'package:flutter/material.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({super.key});

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  Widget build(BuildContext context) {
    String value = "value";
    return Scaffold(
      backgroundColor: bgGreen,
      appBar: CustomAppBar(label: "", isProfile: false, appBar: AppBar()),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            const Text(
              "Lunch",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Recommended portion : $value kcal",
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Food",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // ListView.builder(
                    //     itemCount: 3,
                    //     itemBuilder: (BuildContext, context) {
                    //       FoodCard(
                    //           image: "assets/food.png",
                    //           foodName: "Pizza",
                    //           kcal: 100,
                    //           piece: 2,
                    //           gr: 150);
                    //     }),
                  ],
                ),
              ),
            ))
      ]),
    );
  }
}