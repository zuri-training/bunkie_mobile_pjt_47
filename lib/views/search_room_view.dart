import 'package:bunkie/services/navigation_service.dart';
import 'package:bunkie/utils/constants.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:bunkie/views/interests_and_lifestyle_view.dart';
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.green[800],
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    locator<NavigationService>().goBack();
                  },
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
