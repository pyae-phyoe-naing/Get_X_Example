import 'package:blog_app/screen/home.dart';
import 'package:blog_app/screen/setting.dart';
import 'package:blog_app/screen/upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BottonNavWidget extends StatefulWidget {
  const BottonNavWidget({Key? key}) : super(key: key);

  @override
  State<BottonNavWidget> createState() => _BottonNavWidgetState();
}

class _BottonNavWidgetState extends State<BottonNavWidget> {
  int _currentIndex = 0;
  Widget _body = Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items:  [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.add), label: 'upload'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.settings), label: 'setting'.tr),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              _body = Home();
            } else if (index == 1) {
              _body = const Upload();
            } else if (index == 2) {
              _body = const Setting();
            }
          });
        },
      ),
    );
  }
}
