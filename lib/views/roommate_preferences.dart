import 'package:bunkie/services/navigation_service.dart';
import 'package:bunkie/utils/constants.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/custom_dropdown.dart';

class RoommatePreferencesView extends StatefulWidget {
  _RoommatePreferencesViewState createState() =>
      _RoommatePreferencesViewState();
}

class _RoommatePreferencesViewState extends State<RoommatePreferencesView> {
  var currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        onWillPop: () => Navigator.pop(context),
        builder: (context, size) {
          return Scaffold(
              body: SingleChildScrollView(
                  child: Column(children: [
            CustomSpacer(flex: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            height: 30.w,
                            width: 40.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Icon(Icons.arrow_back,
                                color: Colors.grey, size: 30.w))),
                    GestureDetector(
                      onTap: () {
                        locator<NavigationService>()
                            .pushNamed(SettingsViewRoute);
                      },
                      child: Text(
                        'Next',
                        style: GoogleFonts.cabin(
                            color: Color(0xff027A63), fontSize: 20.sp),
                      ),
                    ),
                  ]),
            ),
            Text('Preferences',
                style: GoogleFonts.cabin(fontSize: 25.sp, color: Colors.grey)),
            CustomSpacer(flex: 2),
            Text('Let us know what you expect from your new roommate',
                textAlign: TextAlign.center,
                style: GoogleFonts.cabin(color: Colors.grey, fontSize: 16.sp)),
            CustomSpacer(flex: 3),
            CustomDropdown(hintText: 'Gender', items: ['Male', 'Female']),
            CustomSpacer(flex: 2),
            CustomDropdown(
                hintText: 'Religion', items: ['Christian', 'Muslim']),
            CustomSpacer(flex: 2),
            CustomDropdown(hintText: 'Tribe', items: []),
            CustomSpacer(flex: 2),
            CustomDropdown(
                hintText: 'Level',
                items: ['100', '200', '300', '400', '500', '600']),
            CustomSpacer(flex: 2),
            CustomDropdown(hintText: 'Age Range', items: []),
          ])));
        });
  }
}
