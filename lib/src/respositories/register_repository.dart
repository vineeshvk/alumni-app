import 'package:alumni_app/src/responses/auth_response.dart';
import 'package:alumni_app/src/utils/api_endpoints.dart';
import 'package:alumni_app/src/utils/dio_helper.dart';
import 'package:dio/dio.dart';

class ResgisterRepository {
  static Future<AuthResponse> register({
    String email,
    String dob,
    String password,
    String name,
    String phone,
    String gender,
    String collegeId,
    String registerNo,
    String batch,
    String major,
    String degree,
  }) async {
    Response res = await dio.post(
      APIEndpoints.register,
      data: {
        "email": email,
        "dob": dob,
        "password": password,
        "name": name,
        "phone": phone,
        "gender": gender,
        "collegeId": collegeId,
        "registerNo": registerNo,
        "batch": batch,
        "major": major,
        "degree": degree
      },
    );

    var data = res.data;
    AuthResponse token = AuthResponse.fromJson(data);

    return token;
  }

  static Future<bool> hasSameEmail(String email) async {
    if (email == "") return false;
    
    Response response = await dio.post(
      APIEndpoints.emailExist,
      data: {"email": email},
    );

    bool hasSameEmail = response.data['emailAlreadyExists'];

    return hasSameEmail;
  }
}
