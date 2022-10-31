import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static late bool _themeData;

  // Theme //
  static void setThemeData(bool value) {
    _themeData = value;
  }

  static getThemeData() {
    return _themeData;
  }

  static void save({required String key, required bool value}) async {
    SharedPreferences sharePreferences = await SharedPreferences.getInstance();
    sharePreferences.setBool(key, value);
  }
}
