import 'package:calorie_tracker/data/models/nutrition_model.dart';
import 'package:calorie_tracker/data/models/user_auth_model.dart';
import 'package:calorie_tracker/data/services/user_auth.dart';
import 'package:calorie_tracker/data/services/user_services.dart';
import 'package:calorie_tracker/ui/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/user_model.dart';

class UserAuthProvider with ChangeNotifier {
  bool result = false;
  UserModel? user = UserModel();
  Nutrition? nutrition = Nutrition();
  List<Nutrition>? nList = [];
  List<Nutrition> nutritionList = [];

  Future signUp(UserAuthModel userAuth, UserModel user) async {
    await UserAuth().signUp(userAuth, user);
    notifyListeners();
  }

  Future signInWithPassword(UserAuthModel userAuth, UserModel user) async {
    UserModel? _user = await UserAuth().signInWithPassword(userAuth, user);
    user = _user!;
    notifyListeners();
  }

  Future signInBoolean(UserAuthModel userAuth, UserModel user) async {
    result = await UserAuth().signInBoolean(userAuth, user);
    notifyListeners();
  }

  Future addNutrition(
      String localId, String category, Nutrition nutrition) async {
    Nutrition? _nutrition =
        await UserServices().addNutrition(localId, category, nutrition);
    nutrition = _nutrition!;
    notifyListeners();
  }

  Future getNutritionByCategory(String localId, String category) async {
    nList = await UserServices().getNutritionsByCategory(localId, category);
    notifyListeners();
  }

  Future getNutritionById(String localId, String category, Nutrition n) async {
    Nutrition? _nutrition =
        await UserServices().getNutritionById(localId, category, n);
    nutrition = _nutrition;
    notifyListeners();
  }

  Future deleteNutritionbyId(
      String localId, String category, Nutrition nutrition) async {
    await UserServices().deleteNutrition(localId, category, nutrition);
    await getNutritionByCategory(localId, category);
    notifyListeners();
  }

  // setNutritions(String mealName) async {
  //   for (var i = 0; i < nList!.length; i++) {
  //     nutritionList
  //         .add(await getNutritionById(user!.localId!, mealName, nList![i]));
  //   }
  //   print(nutritionList);
  //   notifyListeners();
  // }
}
