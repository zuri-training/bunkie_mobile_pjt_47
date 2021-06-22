import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFields extends StatefulWidget {
  final StreamController<ErrorAnimationType> errorController;
  final TextEditingController controller;
  final Function(String) validator;
  final int length;
  final bool hasError;
  const PinCodeFields({
    Key? key,
    required this.controller,
    required this.validator,
    required this.errorController,
    this.hasError = false,
    this.length = 4,
  }) : super(key: key);

  @override
  _PinCodeFieldsState createState() => _PinCodeFieldsState();
}

class _PinCodeFieldsState extends State<PinCodeFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
      child: PinCodeTextField(
        appContext: context,
        pastedTextStyle: TextStyle(
          color: Colors.green.shade600,
          fontWeight: FontWeight.bold,
        ),
        length: widget.length,
        obscureText: false,
        animationType: AnimationType.fade,
        validator: (v) {
          return widget.validator(v!);
        },
        pinTheme: PinTheme(
          inactiveFillColor: Theme.of(context).canvasColor,
          selectedColor: Color(0xff027A63),
          selectedFillColor: Theme.of(context).canvasColor,
          inactiveColor: Color(0xff027A63),
          shape: PinCodeFieldShape.underline,
          activeColor: widget.hasError
              ? Theme.of(context).errorColor
              : Color(0xff027A63),
          activeFillColor: widget.hasError
              ? Theme.of(context).errorColor
              : Theme.of(context).canvasColor,
        ),
        cursorColor: Color(0xff027A63),
        animationDuration: Duration(milliseconds: 300),
        enableActiveFill: true,
        errorAnimationController: widget.errorController,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        onChanged: (value) {},
        beforeTextPaste: (text) {
          return true;
        },
      ),
    );
  }
}
