import 'package:blog_app/screen/home.dart';
import 'package:blog_app/screen/setting.dart';
import 'package:blog_app/screen/upload.dart';
import 'package:flutter/material.dart';

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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Upload'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
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
