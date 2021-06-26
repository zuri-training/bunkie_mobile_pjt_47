import 'package:flutter/material.dart';

import 'package:bunkie/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class InterestButton extends StatefulWidget {
  final String text;
  final double? width;
  final double? height;
  
  const InterestButton({
    Key? key,
    required this.text,
    this.width,
    this.height,
  }) : super(key: key);
  
  _InterestButtonState createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {

  bool _active = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 40.h,
      width: widget.width ?? 70.w,
      child: TextButton(
        onPressed: () => setState(() => _active = !_active),
        child: Text(
          widget.text,
          textAlign: TextAlign.left,
          style: GoogleFonts.cabin(
            color: Colors.black,
            fontSize: 13.sp
          ),
        ),
        style: ButtonStyle(
            backgroundColor: _active ?
              MaterialStateProperty.all(Colors.green)
              : 
              MaterialStateProperty.all(Colors.white),
            side: MaterialStateProperty.all(
              BorderSide(
                color: Colors.black,
              )
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
              )),
            ),
      ),
    );
  }
}