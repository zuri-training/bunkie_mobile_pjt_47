import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  var controller;
  final double? width;
  bool obscureText;
  CustomTextFormField({
    Key? key,
    this.hintText: '',
    required this.controller,
    this.width,
    this.obscureText: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 400,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
        ),
        elevation: 20,
        shadowColor: Colors.grey,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: hintText ?? '',
              hintStyle: TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
