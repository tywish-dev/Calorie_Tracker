import 'dart:convert';
import 'package:calorie_tracker/ui/providers/recipe_provider.dart';
import 'package:calorie_tracker/ui/view/widgets/recipe/recipe_item.dart';
import 'package:calorie_tracker/ui/view/widgets/recipe/recipe_search_bar.dart';

import '/ui/providers/nutrition_provider.dart';
import '/ui/view/widgets/home/custom_app_bar.dart';
import '/ui/view/widgets/search/food_item.dart';
import '/ui/view/widgets/search/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  late TextEditingController recipeSearch;
  @override
  void initState() {
    recipeSearch = TextEditingController(text: "risotto");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Home",
        isProfile: false,
        appBar: AppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            RecipeCustomSearchBar(
              textEditingController: recipeSearch,
            ),
            Expanded(
              child: Consumer<RecipeProvider>(
                builder: (context, recipeProvider, _) => ListView(
                  children: [
                    ...recipeProvider.getRecipes
                        .map((e) => RecipeItem(recipe: e))
                        .toList(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
