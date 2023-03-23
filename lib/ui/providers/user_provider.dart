import 'package:calorie_tracker/data/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel user = UserModel(
    id: "",
    localId: "",
    name: "",
    gender: "",
    height: 0,
    age: 0,
    weight: 0,
    foods: [],
  );

  setUser(UserModel u) {
    user = u;
    notifyListeners();
  }
}
