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
        onWillPop: () => locator<NavigationService>().goBack(),
        builder: (context, size) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Preferences',
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
                    boxShadow: [BoxShadow(
                      color: Colors.green.withAlpha(90),
                      blurRadius: 2,
                    )],
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 25.w
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w, top: 20.h),
                  child: GestureDetector(
                    onTap: () {
                      locator<NavigationService>()
                          .pushNamed(InterestsAndLifestyleViewRoute);
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomSpacer(flex: 2),
                  Text('Let us know what you expect from your new Roommate',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cabin(
                          color: Colors.black, fontSize: 16.sp)),
                  CustomSpacer(flex: 2),
                  CustomDropdown(hintText: 'Location', items: [
                    'Lagos',
                    'Port Harcourt',
                    'Abuja',
                    'Enugu',
                    'Ibadan',
                    'Jos'
                  ]),
                  CustomSpacer(flex: 2),
                  CustomDropdown(hintText: 'Gender', items: ['Male', 'Female']),
                  CustomSpacer(flex: 2),
                  CustomDropdown(
                      hintText: 'Religion',
                      items: ['Christian', 'Muslim', 'others']),
                  CustomSpacer(flex: 2),
                  CustomDropdown(
                      hintText: 'Tribe',
                      items: ['Hausa', 'Ibo', 'Yoruba', 'others']),
                  CustomSpacer(flex: 2),
                  CustomDropdown(
                      hintText: 'Level',
                      items: ['100', '200', '300', '400', '500', '600']),
                  CustomSpacer(flex: 2),
                  CustomDropdown(
                      hintText: 'Age Range',
                      items: ['18-22', '23-25', '26-30', '31-40']),
                  CustomSpacer(flex: 2),
                  CustomDropdown(hintText: 'Budget Range', items: [
                    '50,000.00 - 100,000.00',
                    '110,000.00 - 150,000.00',
                    '160,000.00 - 200,000.00'
                  ]),
                  CustomSpacer(flex: 2),
                  CustomButton(
                    text: 'Submit',
                    onPressed: () {
                      locator<NavigationService>()
                          .pushNamed(InterestsAndLifestyleViewRoute);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
