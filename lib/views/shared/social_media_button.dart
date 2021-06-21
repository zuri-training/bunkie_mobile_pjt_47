import 'package:bunkie/views/shared/shared.dart';
import 'package:flutter/material.dart';

import 'package:bunkie/utils/utils.dart';

class SocialMediaButton extends StatelessWidget {
  final String imagePath;
  final String label;
  const SocialMediaButton({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color(0xff2363C2),
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          height: 40.h,
          width: 140.w,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: Image.asset(imagePath),
            ),
            CustomSpacer(horizontal: true, flex: 2),
            Text(label, style: TextStyle(color: Colors.white, fontSize: 16.sp))
          ])),
    );
  }
}
