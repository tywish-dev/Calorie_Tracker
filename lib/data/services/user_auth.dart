import 'dart:convert';
import '/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import '../models/user_auth_model.dart';
import '../constants/api_constants.dart';
import 'user_services.dart';

Uri getAuthUrl(String endpoint) =>
    Uri.parse("$AUTH_BASE_URL$endpoint?key=$AUTH_API");
Uri getUrl(String endpoint) => Uri.parse("$BASE_URL$endpoint.json");
Uri getShallowUrl(String endpoint) =>
    Uri.parse("$BASE_URL$endpoint.json?shallow=true");

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
      UserServices().postUser(user);
      return user;
    } else {
      null;
    }
  }

  Future<UserModel?> signInWithPassword(
      UserAuthModel userAuth, UserModel user) async {
    http.Response response = await http.post(
      getAuthUrl("signInWithPassword"),
      body: userAuth.toJson(),
      headers: {'Content-Type': "application/json"},
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = jsonDecode(response.body);
      user.localId = data["localId"];
      UserServices().getUserByLocalId(user.localId);
      return user;
    } else {
      null;
    }
  }
}
