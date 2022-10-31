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
  @override
  void initState() {
    super.initState();
    _darkTheme = SaveData.getThemeData();
    print(_darkTheme);
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
        )
      ]),
    );
  }
}
