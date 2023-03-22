import 'dart:convert';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;
import 'user_auth.dart';

class UserServices {
  Future<UserModel?> postUser(UserModel user) async {
    http.Response response = await http.post(
      getUrl("users"),
      body: user.toJson(),
      headers: {'Content-Type': "application/json"},
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = jsonDecode(response.body);
      user.id = data["name"];
      return user;
    } else {
      return null;
    }
  }

  Future<UserModel?> getUserByLocalId(String id) async {
    http.Response response = await http.get(getShallowUrl("users/$id/localId"));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return UserModel.fromJson(response.body)..id = id;
    } else {
      return null;
    }
  }
}
