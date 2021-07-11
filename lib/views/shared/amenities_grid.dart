import 'package:bunkie/views/shared/shared.dart';
import 'package:flutter/material.dart';

import 'package:bunkie/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class AmenitiesGrid extends StatefulWidget {
  final String icon;
  final String amenity;
  final double? spacer;

  /// Custom spacer to align text where icon is not even

  const AmenitiesGrid(
      {Key? key, required this.icon, required this.amenity, this.spacer: 1})
      : super(key: key);

  _AmenitiesGridState createState() => _AmenitiesGridState();
}

class _AmenitiesGridState extends State<AmenitiesGrid> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() => _active = !_active);
        },
        child: Container(
            width: 90.w,
            height: 90.h,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(15),
              color: _active ? Colors.green[800] : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(widget.icon),
                CustomSpacer(flex: widget.spacer),
                Text(widget.amenity,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                      fontSize: 13.sp,
                      color: _active ? Colors.white : Colors.black,
                    ))
              ],
            )));
  }
}
