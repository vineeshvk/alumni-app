import 'package:alumni_app/src/alumni_exception.dart';
import 'package:alumni_app/src/constants/api.dart';
import 'package:alumni_app/src/register/models/register_input_model.dart';
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
    Response res = await dio.post(
      API_URL + API_ENDPOINTS.login,
      data: {"email": email, "password": password},
    );

    if (res.data["error"] != null) throw new AlumniException(res.data["error"]);
    var data = res.data["user"];

    return data["id"];
  }

  Future<String> register({@required RegisterInputModal inputs}) async {
    Response res = await dio.post(
      API_URL + API_ENDPOINTS.register,
      data: inputs.toJson(),
    );
    print(" from res ${res.data}");
    if (res.data["error"] != null) throw new AlumniException(res.data["error"]);

    var data = res.data["user"];

    return data["id"];
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

  Future<bool> hasSameEmail({@required String email}) async {
    print("from hasemail");
    Response response = await dio
        .post(API_URL + API_ENDPOINTS.emailExist, data: {"email": email});
    bool hasSameEmail = response.data['emailAlreadyExists'];

    return hasSameEmail;
  }
}
