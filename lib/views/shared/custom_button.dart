import 'package:flutter/material.dart';

import 'package:bunkie/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.h,
      width: width ?? 150.w,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.cabin(color: Colors.white, fontSize: 17.sp),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[800]),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ))),
      ),
    );
  }
}
