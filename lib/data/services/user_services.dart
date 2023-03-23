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
    }
  }

  Future<List<UserModel>> getUsers() async {
    http.Response response = await http.get(getUrl("users"));

    List<UserModel> list = [];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = jsonDecode(response.body);
      for (var key in data.keys) {
        UserModel user = UserModel.fromMap(data[key])..id = key;
        list.add(user);
      }
    }
    return list;
  }

  Future<UserModel?> getUserByLocalId(String localId) async {
    List<UserModel> users = await getUsers();
    for (var user in users) {
      http.Response response =
          await http.get(getShallowUrl("users/${user.id}/localId"));
      if (localId == response.body) {
        return user;
      }
    }
  }
}