import 'package:blog_app/data/share_preference/save_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final SaveData _saveData = Get.put(SaveData());
  RxBool isMyanmar = false.obs;
  @override
  void onInit() {
    super.onInit();
    _getLanguage();
  }

  void setLanguage({required bool themeValue}) async {
    await _saveData.setLang(themeValue);
    _getLanguage();
  }

  void _getLanguage() {
    _saveData.getLang().then((value) {
      if (value) {
        Get.updateLocale(const Locale('en','MM'));
        isMyanmar.value = true;
      } else {
        Get.updateLocale(const Locale('en', 'US'));
        isMyanmar.value = false;
      }
    });
  }
}
