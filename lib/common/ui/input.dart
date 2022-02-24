import 'package:currencyconverter/common/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final String? hintText;

  final dynamic validator;

  final dynamic onSaved;

  final Function()? onChanged;

  final Function()? toggleEye;

  final KeyboardType? keyboard;

  final String? init;

  final bool? isPassword;

  final Color? isPasswordColor;

  final bool? showObscureText;

  final bool? obscureText;

  final Color? styleColor;

  final Color? hintStyleColor;

  final bool? enabled;

  final bool readOnly;

  final String? labelText;

  final dynamic? maxLines;

  final Color? borderColor;

  final Widget? prefix;

  final Widget? suffix;

  final Key? key;

  final TextEditingController? controller;

  final List<TextInputFormatter>? inputFormatters;

  final Color? fillColor;

  final bool? isError;

  final String? showErrorText;

  final VoidCallback? onTap;

  Input(
      {this.hintText = '',
      required this.validator,
      required this.onSaved,
      this.toggleEye,
      this.init,
      this.isPassword = false,
      this.isPasswordColor,
      this.showObscureText,
      this.obscureText = false,
      this.keyboard,
      this.styleColor = const Color(0xFF252525),
      this.hintStyleColor,
      this.enabled = true,
      this.readOnly = false,
      this.labelText,
      this.maxLines = 1,
      this.borderColor = const Color(0xffADAFB2),
      this.onChanged,
      this.prefix,
      this.key,
      this.controller,
      this.inputFormatters,
      this.fillColor = CustomColors.authFillColor,
      this.isError = false,
      this.showErrorText = "field can't be empty",
      this.suffix,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: TextFormField(
          onTap: onTap != null ? onTap : () {},
          inputFormatters: inputFormatters,
          controller: controller,
          key: key,
          enabled: enabled,
          readOnly: readOnly,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              color: styleColor),
          cursorColor: styleColor,
          obscureText: obscureText as bool,
          maxLines: maxLines,
          onChanged: onChanged != null ? onChanged!() : (String) {},
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25, 20, 20, 20),
            filled: true,
            fillColor: fillColor,
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black),
            hintText: hintText ?? labelText,
            hintStyle: TextStyle(fontSize: 14, color: Color(0xff808080)),
            isDense: true,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: borderColor as Color),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: borderColor as Color),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: borderColor as Color),
            ),
            suffixIconConstraints: BoxConstraints(
              minWidth: 2,
              minHeight: 2,
            ),
            suffixIcon:
                Container(padding: EdgeInsets.only(right: 20), child: suffix),
            errorText: isError ?? true ? showErrorText : null,
          ),
          validator: validator,
          initialValue: init,
          onSaved: onSaved,
          keyboardType: keyboard == KeyboardType.EMAIL
              ? TextInputType.emailAddress
              : keyboard == KeyboardType.NUMBER
                  ? TextInputType.number
                  : keyboard == KeyboardType.PHONE
                      ? TextInputType.phone
                      : TextInputType.text),
    );
  }
}

enum KeyboardType { EMAIL, PHONE, NUMBER, TEXT }
