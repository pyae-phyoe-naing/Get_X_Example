import 'package:blog_app/controller/language_controller.dart';
import 'package:blog_app/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    LanguageController languageController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Column(children: [
        Obx(() {
          return Card(
            child: ListTile(
                title: const Text("Dark Theme"),
                trailing: Switch(
                  value: themeController.isDark.value,
                  onChanged: (bolValue) {
                    themeController.setTheme(themeValue: bolValue);
                  },
                )),
          );
        }),
        Obx(() {
          return Card(
            child: ListTile(
                title: const Text("မြန်မာဘာသာပြောင်းရန်"),
                trailing: Switch(
                  value: languageController.isMyanmar.value,
                  onChanged: (bolValue) {
                    languageController.setLanguage(themeValue: bolValue);
                  },
                )),
          );
        }),
      ]),
    );
  }
}
