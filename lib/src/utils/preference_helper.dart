import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    return token;
  }

// ? TODO is it needed
  static Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") != null;
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
  }

  static Future<void> removeToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("token");
  }
}
