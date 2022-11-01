import 'package:blog_app/data/share_preference/save_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late bool _darkTheme;
  late bool _lang;
  @override
  void initState() {
    super.initState();
    _darkTheme = SaveData.getThemeData();
    _lang = SaveData.getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    _darkTheme = (brightness == Brightness.dark);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Column(children: [
        Card(
          child: ListTile(
              title: const Text("Dark Theme"),
              trailing: Switch(
                value: _darkTheme,
                onChanged: (bol) {
                  if (bol) {
                    setState(() {
                      SaveData.save(key: 'themeData', value: true);
                      SaveData.setThemeData(true);
                      Get.changeTheme(ThemeData.dark());
                      _darkTheme = true;
                    });
                  } else {
                    setState(() {
                      SaveData.save(key: 'themeData', value: false);
                      SaveData.setThemeData(false);
                      Get.changeTheme(ThemeData.light());
                      _darkTheme = false;
                    });
                  }
                },
              )),
        ),
        Card(
          child: ListTile(
              title: const Text("မြန်မာဘာသာပြောင်းရန်"),
              trailing: Switch(
                value: _lang,
                onChanged: (bol) {
                  setState(() {
                    _lang = bol;
                    if (bol) {
                      SaveData.save(key: 'lang', value: true);
                      SaveData.setLanguage(true);
                      Get.updateLocale(const Locale('en', 'MM'));
                    } else {
                      SaveData.save(key: 'lang', value: false);
                      SaveData.setLanguage(false);
                      Get.updateLocale(const Locale('en', 'US'));
                    }
                  });
                },
              )),
        )
      ]),
    );
  }
}
