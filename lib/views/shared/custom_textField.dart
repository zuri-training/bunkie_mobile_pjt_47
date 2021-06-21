import 'package:flutter/material.dart';

import 'package:bunkie/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final int? maxLines;
  const CustomTextField({
    Key? key,
    this.suffixIcon,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: Colors.green.shade900,
        maxLines: maxLines ?? maxLines,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff027A63), width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          suffixIcon: suffixIcon ?? suffixIcon,
          contentPadding: EdgeInsets.symmetric(vertical: 3.h),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff027A63), width: 3),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff027A63), width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ));
  }
}
