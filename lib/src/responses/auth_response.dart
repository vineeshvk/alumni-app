import 'package:alumni_app/src/models/user.dart';

class AuthResponse {
  String error;
  User user;

  AuthResponse({this.error, this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      error: json["error"],
      user: User.fromJson(json["user"]),
    );
  }
}
