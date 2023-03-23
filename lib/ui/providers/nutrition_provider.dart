import 'package:calorie_tracker/data/models/nutrition_model.dart';
import 'package:calorie_tracker/data/services/nutrition_services.dart';
import 'package:flutter/material.dart';

class NutritionProvider with ChangeNotifier {
  List<Nutrition> _foods = [];

  List<Nutrition> get getFoods => _foods;

  Future getNutrition(String query) async {
    _foods = await NutritionServices().getNutrition(query);
    notifyListeners();
  }
}
