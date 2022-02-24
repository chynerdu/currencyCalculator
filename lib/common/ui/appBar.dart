import 'package:currencyconverter/common/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 25,
            height: 25,
            child: Image.asset('assets/icons/hamburger.png')),
        GestureDetector(
          child: Text(
            'Sign up',
            style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                color: CustomColors.green,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
