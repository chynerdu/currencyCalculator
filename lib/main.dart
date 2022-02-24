import 'package:currencyconverter/common/colors.dart';
import 'package:currencyconverter/pages/home/homescreen.dart';
import 'package:currencyconverter/pages/home/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primaryColor: CustomColors.PrimaryColor,
      ),
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
