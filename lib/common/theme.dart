import 'package:currencyconverter/common/colors.dart';
import 'package:flutter/material.dart';

class CurrencyCalculatorTheme {
  static const TextStyle appNameStyle = TextStyle(
      fontSize: 40,
      color: CustomColors.PrimaryColor,
      fontWeight: FontWeight.w800,
      height: 1.3,
      // height: 1.0,
      letterSpacing: 1.5);

  static const TextStyle suffixText = TextStyle(
      color: CustomColors.grey, fontSize: 18, fontWeight: FontWeight.w500);
}
