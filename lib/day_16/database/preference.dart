import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  Future<void> storingIsLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', value);
  }

  static Future<bool?> getIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin');
  }
}
