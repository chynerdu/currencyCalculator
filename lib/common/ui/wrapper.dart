import 'package:flutter/material.dart';

class CurrencyCalculatorWrapper extends StatelessWidget {
  final Widget child;
  CurrencyCalculatorWrapper({required this.child});
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.fromLTRB(20, 60, 20, 10),
        child: child);
  }
}
