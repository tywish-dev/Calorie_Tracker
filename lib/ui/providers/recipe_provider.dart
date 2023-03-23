import 'package:calorie_tracker/data/models/recipe_model.dart';
import 'package:calorie_tracker/data/services/recipe_services.dart';
import 'package:flutter/material.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [];

  List<Recipe> get getRecipes => _recipes;

  Future getRecipe(String query) async {
    _recipes = await RecipeServices().getRecipe(query);
    notifyListeners();
  }
}
