import 'dart:convert';
import 'package:calorie_tracker/data/models/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeServices {
  Uri getUrl(String query) =>
      Uri.parse("https://api.calorieninjas.com/v1/recipe?query=$query");

  Future<List<Recipe>> getRecipe(String query) async {
    http.Response response = await http.get(getUrl(query));

    List<Recipe> recipes = [];
    var data = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      for (var i = 0; i < data.length; i++) {
        Recipe recipe = Recipe.fromJson(data[i]);
        recipes.add(recipe);
      }
    }
    return recipes;
  }
}
