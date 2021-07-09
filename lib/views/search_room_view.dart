import 'package:bunkie/services/navigation_service.dart';
import 'package:bunkie/utils/constants.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/custom_dropdown.dart';

class SearchRoomView extends StatefulWidget {
  _SearchRoomViewState createState() => _SearchRoomViewState();
}

class _SearchRoomViewState extends State<SearchRoomView> {
  var currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        onWillPop: () => Navigator.pop(context),
        builder: (context, size) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text(
                  'Search Criteria',
                  style: GoogleFonts.cabin(
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
              ),
              body: SingleChildScrollView(
                  child: Column(children: [
                CustomSpacer(flex: 2),
                Text('Input your matching criteria',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                        color: Colors.black, fontSize: 16.sp)),
                CustomSpacer(flex: 2),
                CustomDropdown(hintText: 'University', items: [
                  'University of Lagos',
                  'University of Port Harcourt',
                  'University of Abuja',
                  'Enugu State University',
                  'University of Ibadan',
                  'University of Jos'
                ]),
                CustomSpacer(flex: 2),
                CustomDropdown(hintText: 'Budget Range', items: [
                  '50,000.00 - 100,000.00',
                  '110,000.00 - 150,000.00',
                  '160,000.00 - 200,000.00'
                ]),
                CustomSpacer(flex: 2),
                CustomDropdown(
                    hintText: 'Move in',
                    items: ['January', 'February', 'March', 'April', 'May']),
                CustomSpacer(flex: 2),
                CustomButton(
                  text: 'Search',
                  onPressed: () {
                    locator<NavigationService>()
                        .pushNamed(ApartmentSearchViewRoute);
                  },
                ),
              ])));
        });
  }
}
