import 'dart:convert';

import 'package:calorie_tracker/data/models/nutrition_model.dart';
import 'package:http/http.dart' as http;

class NutritionServices {
  Uri getUrl(String query) =>
      Uri.parse("https://api.calorieninjas.com/v1/nutrition?query=$query");

  Future<List<Nutrition>> getNutrition(String query) async {
    http.Response response = await http.get(
      getUrl(query),
      headers: {'X-Api-Key': 'suogqiB2ZUkDoTvOElDCDQ==LTq0torYOlcrSr4R'},
    );

    List<Nutrition> foods = [];
    var data = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      for (var i in data["items"]) {
        Nutrition nutrition = Nutrition.fromMap(i);
        foods.add(nutrition);
        print(foods.length);
      }
    }
    return foods;
  }
}
