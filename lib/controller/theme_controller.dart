import 'package:blog_app/data/share_preference/save_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final SaveData _saveData = Get.put(SaveData());
  RxBool isDark = false.obs;
  @override
  void onInit() {
    super.onInit();
    _getTheme();
  }

  void setTheme({required bool themeValue}) async {
    await _saveData.setTheme(themeValue);
    _getTheme();
  }

  void _getTheme() {
    _saveData.getTheme().then((value) {
      if (value) {
        Get.changeThemeMode(ThemeMode.dark);
        isDark.value = true;
      } else {
        Get.changeThemeMode(ThemeMode.light);
        isDark.value = false;
      }
    });
  }
}
