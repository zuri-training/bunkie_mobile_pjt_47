import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'dart:async';

import 'shared/custom_spacer.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Help',
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
              Navigator.pop(context);
            },
          ),
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
                            style: TextStyle(
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
                            style: TextStyle(
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
                            style: TextStyle(
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
                            style: TextStyle(
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
