import 'package:shared_preferences/shared_preferences.dart';

class SherdPref {
static   late SharedPreferences sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static bool  isFristTime() {
    return sharedPreferences.getBool('isFristTime') ?? true;
  }

 static setFristTime() {
    sharedPreferences.setBool('isFristTime', false);
  }
}
