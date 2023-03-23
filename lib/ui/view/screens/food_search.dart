import 'dart:convert';

import 'package:calorie_tracker/ui/providers/nutrition_provider.dart';
import 'package:calorie_tracker/ui/view/widgets/home/custom_app_bar.dart';
import 'package:calorie_tracker/ui/view/widgets/search/food_item.dart';
import 'package:calorie_tracker/ui/view/widgets/search/search_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodSearch extends StatefulWidget {
  const FoodSearch({super.key});

  @override
  State<FoodSearch> createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  late TextEditingController foodSearch;
  @override
  void initState() {
    foodSearch = TextEditingController(text: "tomato");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NutritionProvider nutritionProvider =
        Provider.of<NutritionProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        label: "Home",
        isProfile: false,
        appBar: AppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            CustomSearchBar(
              textEditingController: foodSearch,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ...nutritionProvider.getFoods
                          .map((e) => FoodItem(nutrition: e))
                          .toList(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
