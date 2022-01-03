import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_css/view/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: LoginPage(),
    );
  }
}
