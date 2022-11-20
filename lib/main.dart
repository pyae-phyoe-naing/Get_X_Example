import 'package:blog_app/controller/language_controller.dart';
import 'package:blog_app/controller/theme_controller.dart';
import 'package:blog_app/data/api_service/post_api_service.dart';
import 'package:blog_app/data/utils/localization.dart';
import 'package:blog_app/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // if use sharedP must be insert it
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.put(sharedPreferences);
  Get.put(ThemeController());
  Get.put(LanguageController());
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
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      translations: LocalizationEx(),
      fallbackLocale: const Locale('en', 'US'),
      home: const BottonNavWidget(),
    );
  }
}
