import 'package:alumni_app/src/constants/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final Dio dio;

  UserRepository({@required this.dio});

  Future<String> login({
    @required String email,
    @required String password,
  }) async {
    Response response = await dio.post(
      API_URL + API_ENDPOINTS.login,
      data: {"email": email, "password": password},
    );

    var data = response.data["user"];
    var error = response.data["error"];

    if (data != null && data["id"] != null) return data["id"];
    return null;
  }

  Future<Map<String, String>> register({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    Response response = await dio.post(
      API_URL + API_ENDPOINTS.register,
      data: {"name": name, "email": email, "password": password},
    );

    var data = response.data["user"];
    var error = response.data["error"];

    if (error != null) return {"error": error};

    if (data != null && data["id"] != null) return {"token": data["id"]};
    return {"error": "Something went wrong"};
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> persistToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', token);
  }

  Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('userId') != null;
  }

  Future<bool> hasSameEmail(String email) async {
    Response response = await dio
        .post(API_URL + API_ENDPOINTS.emailExist, data: {"email": email});
    print("From url" + response.data);

    bool hasSameEmail = response.data['emailAlreadyExists'];
    return hasSameEmail;
  }
}
