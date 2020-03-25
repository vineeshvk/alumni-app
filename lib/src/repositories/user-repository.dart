import 'package:alumni_app/src/constants/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final Dio dio;

  UserRepository({@required this.dio});

  Future<String> authenticate(
      {@required String email, @required String password}) async {
    Response response = await dio.post(
      API_URL + API_ENDPOINTS.login,
      data: {"email": email, "password": password},
    );

    var data = response.data["user"];

    if (data != null && data["id"] != null) return data["id"];
    return null;
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> persistToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', token);
  }

  Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('userId') != null;
  }
}
