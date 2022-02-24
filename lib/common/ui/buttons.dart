import 'package:currencyconverter/common/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.key,
      this.color = CustomColors.green,
      this.borderColor = CustomColors.green,
      required this.text,
      this.textColor = Colors.white,
      @required this.onPressed,
      this.disabled = false})
      : super(key: key);
  final Color color;
  final Color borderColor;
  final String text;
  final Color textColor;
  final Key? key;

  final Function()? onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 54,
      onPressed: disabled == true ? null : onPressed,
      color: CustomColors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
            color: disabled == true
                ? CustomColors.green.withOpacity(0.4)
                : CustomColors.green,
            width: 1,
            style: BorderStyle.solid),
      ),
      disabledColor: disabled == true
          ? CustomColors.green.withOpacity(0.4)
          : CustomColors.green,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 1.1,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    this.key,
    this.color = CustomColors.green,
    this.borderColor = CustomColors.green,
    this.textColor = Colors.white,
  }) : super(key: key);
  final Color color;
  final Color borderColor;

  final Color textColor;
  final Key? key;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 54,
      onPressed: () => null,
      color: CustomColors.green.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
            color: CustomColors.green, width: 1, style: BorderStyle.solid),
      ),
      child: Container(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ))),
      ),
    );
  }
}
