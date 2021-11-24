// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:your_bmi/screens/bmi_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF1E1531),
        scaffoldBackgroundColor: Color(0xFF1E1531),
      ),
      home: BMIcalc(),
    );
  }
}
