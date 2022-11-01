import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static late bool _themeData;
  static late bool _lang;
  // Theme //
  static void setThemeData(bool value) {
    _themeData = value;
  }

  static getThemeData() {
    return _themeData;
  }
  // Language //
  static void setLanguage(bool value) {
    _lang = value;
  }

  static getLanguage() {
    return _lang;
  }
  //
  static void save({required String key, required bool value}) async {
    SharedPreferences sharePreferences = await SharedPreferences.getInstance();
    sharePreferences.setBool(key, value);
  }
}
