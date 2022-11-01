import 'package:blog_app/data/api_service/post_api_service.dart';
import 'package:blog_app/data/share_preference/save_data.dart';
import 'package:blog_app/data/utils/localization.dart';
import 'package:blog_app/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Get.put(PostApiService());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences preferences) {
      SaveData.setThemeData(preferences.getBool('themeData') ?? false);
      SaveData.setLanguage(preferences.getBool('lang') ?? false);
      if (SaveData.getThemeData() == true) {
        Get.changeTheme(ThemeData.dark());
      }
      if (SaveData.getThemeData() == false) {
        Get.changeTheme(ThemeData.light());
      }
       if (SaveData.getLanguage() == true) {
        Get.updateLocale(const Locale('en', 'MM'));
      }
      if (SaveData.getLanguage() == false) {
         Get.updateLocale(const Locale('en', 'US'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      translations: LocalizationEx(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      home: const BottonNavWidget(),
    );
  }
}
