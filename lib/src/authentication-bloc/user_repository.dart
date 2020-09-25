import 'package:alumni_app/src/alumni_exception.dart';
import 'package:alumni_app/src/models/register_input_model.dart';
import 'package:alumni_app/src/models/user.dart';
import 'package:alumni_app/src/utils/api_endpoints.dart';
import 'package:alumni_app/src/utils/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class UserRepository {
  Future<User> register({@required RegisterInputModal inputs}) async {
    Response res = await dio.post(
      API_BASE_URL + APIEndpoints.alumniRegister,
      data: inputs.toJson(),
    );
    print(" from res ${res.data}");
    if (res.data["error"] != null) throw new AlumniException(res.data["error"]);

    var data = User.fromJson(res.data["user"]);

    return data;
  }

  Future<bool> hasSameEmail({@required String email}) async {
    print("from has email");
    Response response = await dio
        .post(API_BASE_URL + APIEndpoints.emailExist, data: {"email": email});
    bool hasSameEmail = response.data['emailAlreadyExists'];

    return hasSameEmail;
  }
}
