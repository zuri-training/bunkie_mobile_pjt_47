import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/custom_spacer.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      onWillPop: () => locator<NavigationService>().goBack(),
      builder: (context, size) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Help',
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
          )
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: SafeArea(
                  child: Column(
                    children: [
                      CustomSpacer(flex: 3),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'Report a Problem.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 17.sp,
                              color: Colors.green[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 2),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 2),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'Terms and Conditions.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 17.sp,
                              color: Colors.green[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 2),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 2),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'Contact Us.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 17.sp,
                              color: Colors.green[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 2),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 2),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'FAQ.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 17.sp,
                              color: Colors.green[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 2),
                      Divider(color: Colors.black, thickness: 0.4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
