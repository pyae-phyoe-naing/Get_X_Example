import 'package:blog_app/data/api_service/post_api_service.dart';
import 'package:blog_app/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(PostApiService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: BottonNavWidget(),
    );
  }
}
