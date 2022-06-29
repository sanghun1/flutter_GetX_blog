import 'package:blog/pages/post/home_page.dart';
import 'package:blog/pages/user/join_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/user/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}