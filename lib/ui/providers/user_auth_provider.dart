import 'package:calorie_tracker/data/models/user_auth_model.dart';
import 'package:calorie_tracker/data/services/user_auth.dart';
import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';

class UserAuthProvider with ChangeNotifier {
  Future signUp(UserAuthModel userAuth, UserModel user) async {
    await UserAuth().signUp(userAuth, user);
    notifyListeners();
  }

  Future signInWithPassword(UserAuthModel userAuth, UserModel user) async {
    await UserAuth().signInWithPassword(userAuth, user);
    notifyListeners();
  }
}
