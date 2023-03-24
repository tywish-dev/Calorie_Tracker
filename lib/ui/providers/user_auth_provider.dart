import 'package:calorie_tracker/data/models/user_auth_model.dart';
import 'package:calorie_tracker/data/services/user_auth.dart';
import 'package:calorie_tracker/ui/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/user_model.dart';

class UserAuthProvider with ChangeNotifier {
  bool result = false;
  UserModel? user = UserModel();

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
}
