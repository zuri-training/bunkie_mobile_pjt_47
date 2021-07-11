import 'dart:developer';

import 'package:bunkie/services/auth_service.dart';
import 'package:bunkie/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
  AuthService _authService = AuthService();
  User? loggedInUser;
  String? firstname;
  @override
  void initState() {
    loggedInUser = _authService.currentUser();
    log(loggedInUser!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      onWillPop: () => locator<NavigationService>().goBack(),
      builder: (context, size) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Amenities',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.green[800],
              leading: GestureDetector(
                onTap: () => locator<NavigationService>().goBack(),
                child: Container(
                  height: 15.h,
                  width: 6.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withAlpha(90),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Icon(Icons.arrow_back, size: 25.w),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w, top: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      locator<NavigationService>().pushNamed(SettingsViewRoute);
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                CustomSpacer(flex: 3),
                Text(
                    'What amenities would you like to have \nin your new room?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                        color: Colors.black, fontSize: 16.sp)),
                CustomSpacer(flex: 3),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AmenitiesGrid(
                              icon: 'assets/images/misc/tap_icon.png',
                              amenity: 'Water'),
                          CustomSpacer(flex: 1, horizontal: true),
                          AmenitiesGrid(
                              icon: 'assets/images/misc/power_icon.png',
                              amenity: 'Electricity'),
                          CustomSpacer(flex: 1, horizontal: true),
                          AmenitiesGrid(
                              icon: 'assets/images/misc/WardR_icon.png',
                              amenity: 'Wardrobe'),
                        ],
                      ),
                      CustomSpacer(flex: 1),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AmenitiesGrid(
                                icon: 'assets/images/misc/E_fan_icon.png',
                                amenity: 'Fan'),
                            CustomSpacer(flex: 1, horizontal: true),
                            AmenitiesGrid(
                                icon: 'assets/images/misc/kitchen_icon.png',
                                amenity: 'Kitchen'),
                            CustomSpacer(flex: 1, horizontal: true),
                            AmenitiesGrid(
                              icon: 'assets/images/misc/toilet_icon.png',
                              amenity: 'Toilet',
                            ),
                          ]),
                      CustomSpacer(flex: 1),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AmenitiesGrid(
                                icon: 'assets/images/misc/batR_icon.png',
                                amenity: 'Bathroom'),
                            CustomSpacer(flex: 1, horizontal: true),
                            AmenitiesGrid(
                                icon: 'assets/images/misc/Acc_icon.png',
                                amenity: 'A/C'),
                            CustomSpacer(flex: 1, horizontal: true),
                            AmenitiesGrid(
                                icon: 'assets/images/misc/C_park_icon.png',
                                amenity: 'Parking'),
                          ])
                    ])),
                CustomSpacer(flex: 6),
                CustomButton(
                  text: 'Done',
                  onPressed: () {
                    locator<NavigationService>().pushNamed(SettingsViewRoute);
                  },
                ),
                CustomSpacer(flex: 8),
              ]),
            ));
      },
    );
  }
}
