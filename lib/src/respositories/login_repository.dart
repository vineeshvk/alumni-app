import 'package:alumni_app/src/responses/auth_response.dart';
import 'package:alumni_app/src/utils/api_endpoints.dart';
import 'package:alumni_app/src/utils/dio_helper.dart';

class LoginRepository {
  static Future<AuthResponse> login(String email, String password) async {
    final res = await dio.post(
      APIEndpoints.login,
      data: {"email": email, "password": password},
    );

    var data = res.data;
    AuthResponse token = AuthResponse.fromJson(data);

    return token;
  }
}
