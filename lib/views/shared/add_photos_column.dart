import 'package:flutter/material.dart';

import 'package:bunkie/utils/utils.dart';

class AddPhotosColumn extends StatelessWidget {
  final String description;
  final String imageUrl;
  final String imageUrl2;
  const AddPhotosColumn({
    Key? key,
    required this.description,
    required this.imageUrl,
    required this.imageUrl2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            description,
            style: TextStyle(color: Colors.black54, fontSize: 17.sp),
          ),
        ),
        Container(
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 10.w, top: 10.h, bottom: 10.h),
                  height: 90.h,
                  width: 90.w,
                  child: Image.network(imageUrl, fit: BoxFit.cover)),
              Container(
                  height: 90.h,
                  width: 90.w,
                  child: Image.network(imageUrl2, fit: BoxFit.cover)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Color(0xff027A63),
                    size: 40,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
