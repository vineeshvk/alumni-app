import 'package:alumni_app/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static Future<User> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id = pref.getString(
      "token",
    );
    String email = pref.getString("email");
    String name = pref.getString(
      "name",
    );
    bool admin = pref.getBool("admin");
    return User(admin: admin, email: email, name: name, id: id);
  }

  static Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") != null;
  }

  static Future<void> saveToken(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", user.id);
    pref.setString("email", user.email);
    pref.setString("name", user.name);
    pref.setBool("admin", user.admin);
  }

  static Future<void> removeToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("token");
  }
}
