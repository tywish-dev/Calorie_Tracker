import 'dart:convert';
import 'dart:io';
import '/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import '../models/user_auth_model.dart';
import '../constants/api_constants.dart';
import 'user_services.dart';

Uri getAuthUrl(String endpoint) =>
    Uri.parse("$AUTH_BASE_URL$endpoint?key=$AUTH_API");
Uri getUrl(String endpoint, idToken) =>
    Uri.parse("$BASE_URL$endpoint.json?auth=$idToken");
Uri getNutUrl(String endpoint, category) =>
    Uri.parse("$BASE_URL$endpoint$category.json");

class UserAuth {
  Future<UserModel?> signUp(UserAuthModel userAuth, UserModel user) async {
    http.Response response = await http.post(
      getAuthUrl("signUp"),
      body: userAuth.toJson(),
      headers: {'Content-Type': "application/json"},
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = jsonDecode(response.body);
      user.localId = data["localId"];
      UserServices().postUser(user, user.localId!);
      return user;
    }
  }

  Future<UserModel?> signInWithPassword(
      UserAuthModel userAuth, UserModel user) async {
    http.Response response = await http.post(
      getAuthUrl("signInWithPassword"),
      body: userAuth.toJson(),
      headers: {'Content-Type': "application/json"},
    );
    if (response.statusCode == HttpStatus.accepted) {
      var data = jsonDecode(response.body);
      user.localId = data["localId"];
      user.id = data["idToken"];
      UserServices().getUserByLocalId(user.localId!, user.id);
      return user;
    }
  }

  Future<bool> signInBoolean(UserAuthModel userAuth, UserModel user) async {
    http.Response response = await http.post(
      getAuthUrl("signInWithPassword"),
      body: userAuth.toJson(),
      headers: {'Content-Type': "application/json"},
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      user.localId = data["localId"];
      return data["registered"];
    }
    return false;
  }
}
