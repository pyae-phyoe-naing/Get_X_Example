import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static const themeKey = 'theme';
  static const langKey = 'language';

  SharedPreferences sharedPreferences = Get.find();

  Future<bool> setTheme(bool value) async {
    return sharedPreferences.setBool(themeKey, value);
  }

  Future<bool> getTheme() async {
    return sharedPreferences.getBool(themeKey) ?? false;
  }

  Future<bool> setLang(bool value) async {
    return sharedPreferences.setBool(langKey, value);
  }

  Future<bool> getLang() async {
    return sharedPreferences.getBool(langKey) ?? false;
  }
}
