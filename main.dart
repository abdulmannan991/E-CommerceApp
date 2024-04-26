import 'package:ecommerce_app/Login_Page.dart';
import 'package:ecommerce_app/greeting_Screen.dart';
import 'package:ecommerce_app/theme.dart';
import 'package:ecommerce_app/try_code.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

 
  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Login_Page(),
      theme: lightmode,
    );
  }
}


//  theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),