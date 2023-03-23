import 'dart:convert';
import 'package:calorie_tracker/data/models/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeServices {
  Uri getUrl(String query) =>
      Uri.parse("https://api.calorieninjas.com/v1/recipe?query=$query");

  Future<List<Recipe>> getRecipe(String query) async {
    http.Response response = await http.get(getUrl(query),
        headers: {'X-Api-Key': 'suogqiB2ZUkDoTvOElDCDQ==LTq0torYOlcrSr4R'});

    List<Recipe> recipes = [];
    var data = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      for (var i in data) {
        Recipe recipe = Recipe.fromMap(i);
        recipes.add(recipe);
      }
    }
    print(recipes.length);

    return recipes;
  }
}
