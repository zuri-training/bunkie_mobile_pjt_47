import 'package:bunkie/services/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/amenities_grid.dart';
import 'shared/custom_spacer.dart';
import 'package:bunkie/utils/utils.dart';

import 'shared/shared.dart';

class AmenitiesView extends StatefulWidget {
  _AmenitiesViewState createState() => _AmenitiesViewState();
}

class _AmenitiesViewState extends State<AmenitiesView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      onWillPop: () => Navigator.pop(context),
      builder: (context, size) {
        return Scaffold(
            body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            CustomSpacer(flex: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          height: 35.w,
                          width: 40.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey)),
                          child: Icon(Icons.arrow_back,
                              color: Colors.grey, size: 30))),
                  GestureDetector(
                      onTap: () {
                        locator<NavigationService>()
                            .pushNamed(InterestsAndLifestyleViewRoute);
                      },
                      child: Text(
                        'Next',
                        style: GoogleFonts.cabin(
                            color: Color(0xff027A63), fontSize: 24.sp),
                      )),
                ],
              ),
            ),
            CustomSpacer(flex: 3),
            RichText(
                text: TextSpan(
                    text: 'Hello ',
                    style: GoogleFonts.cabin(
                      color: Colors.grey,
                      fontSize: 28.sp,
                    ),
                    children: [
                  TextSpan(
                      text: 'James😃', // \u{1F600}
                      style: GoogleFonts.cabin(
                          color: Colors.black, fontWeight: FontWeight.bold))
                ])),
            CustomSpacer(flex: 5),
            Container(
                padding: EdgeInsets.only(right: 250.w, bottom: 10),
                child: Text('Amenities',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.cabin(
                        color: Color(0xff027A63), fontSize: 20.sp))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                child: Column(children: [
                  Row(
                    children: [
                      AmenitiesGrid(
                          icon: 'assets/images/misc/running_water_icon.png',
                          amenity: 'Water'),
                      AmenitiesGrid(
                          icon: 'assets/images/misc/electricity_icon.png',
                          amenity: 'Electricity'),
                      AmenitiesGrid(
                          icon: 'assets/images/misc/wardrobe_icon.png',
                          amenity: 'Wardrobe'),
                    ],
                  ),
                  Row(children: [
                    AmenitiesGrid(
                        icon: 'assets/images/misc/fan_icon.png',
                        amenity: 'Fan'),
                    AmenitiesGrid(
                        icon: 'assets/images/misc/pot_icon.png',
                        amenity: 'Kitchen'),
                    AmenitiesGrid(
                      icon: 'assets/images/misc/toilet_bottom_icon.png',
                      amenity: 'Toilet',
                      spacer: 4,
                    ),
                  ]),
                  Row(children: [
                    AmenitiesGrid(
                        icon: 'assets/images/misc/bathroom_icon.png',
                        amenity: 'Bathroom'),
                    AmenitiesGrid(
                        icon: 'assets/images/misc/ac_icon.png', amenity: 'A/C'),
                    AmenitiesGrid(
                        icon: 'assets/images/misc/parking_icon.png',
                        amenity: 'Parking'),
                  ])
                ])),
            CustomSpacer(flex: 8),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    'Comments',
                    style: GoogleFonts.cabin(fontSize: 15, color: Colors.grey),
                  ),
                )),
            CustomSpacer(flex: 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomTextField(maxLines: 5),
            ),
            CustomSpacer(flex: 8),
          ]),
        ));
      },
    );
  }
}
