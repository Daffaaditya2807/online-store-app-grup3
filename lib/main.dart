import 'package:flutter/material.dart';
import 'package:online_app_final_project/page/detail_product.dart';
import 'package:online_app_final_project/page/profile.dart';
import 'package:online_app_final_project/page/profile_detail.dart';
import 'package:online_app_final_project/page/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
