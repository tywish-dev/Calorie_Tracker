import 'dart:convert';
import 'package:calorie_tracker/data/models/nutrition_model.dart';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;
import 'user_auth.dart';

class UserServices {
  Future<UserModel?> postUser(UserModel user, String localId) async {
    http.Response response = await http.put(
      getUrl("users/$localId", user.id),
      body: user.toJson(),
      headers: {'Content-Type': "application/json"},
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return user;
    }
  }

  // Future<List<UserModel>> getUsers() async {
  //   http.Response response = await http.get(getUrl("users"));

  //   List<UserModel> list = [];
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     var data = jsonDecode(response.body);
  //     for (var key in data.keys) {
  //       UserModel user = UserModel.fromMap(data[key])..localId = key;
  //       list.add(user);
  //     }
  //   }
  //   return list;
  // }

  Future<UserModel?> getUserByLocalId(String localId, idToken) async {
    http.Response response = await http.get(getUrl("users/$localId", idToken));
    if (response.statusCode == 200) {
      var data = response.body;
      return UserModel.fromJson(data);
    }
  }

  Future<bool?> updateUserById(String localId, UserModel user) async {
    http.Response response = await http.put(getUrl("users/$localId", user.id),
        body: user.toJson(), headers: {'Content-Type': "application/json"});

    return response.statusCode >= 200 && response.statusCode < 300;
  }

  Future<Nutrition?> addNutrition(
      String localId, String category, Nutrition n) async {
    http.Response response = await http.post(
      getNutUrl("users/$localId/food/", category),
      body: n.toJson(),
      headers: {'Content-Type': "application/json"},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      n.id = data["name"];

      return n;
    }
  }

  // Future<List<Nutrition>?> getNutritions(
  //     String localId, String category, Nutrition n) async {
  //   http.Response response =
  //       await http.get(Uri.parse("users/$localId/food/$category/${n.id}"));
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);

  //     return n;
  //   }
  // }
}
