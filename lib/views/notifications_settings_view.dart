import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';

import 'shared/custom_spacer.dart';

class NotificationsSettingsView extends StatefulWidget {
  @override
  _NotificationsSettingsViewState createState() =>
      _NotificationsSettingsViewState();
}

class _NotificationsSettingsViewState extends State<NotificationsSettingsView> {
  bool allow = true;
  bool sound = true;
  bool roommate = true;
  bool messages = true;
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Notification Settings',
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: SafeArea(
                  child: Column(
                    children: [
                      CustomSpacer(flex: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                'Allow Notifications',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.green[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Switch(
                              value: allow,
                              onChanged: (value) {
                                setState(() {
                                  allow = value;
                                });
                              },
                              activeTrackColor: Colors.green[800],
                              activeColor: Colors.white,
                              splashRadius: 10,
                            ),
                          ),
                        ],
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    'Default Notification Sound',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    'Iphone Pop',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Switch(
                              value: sound,
                              onChanged: (value) {
                                setState(() {
                                  sound = value;
                                });
                              },
                              activeTrackColor: Colors.green[800],
                              activeColor: Colors.white,
                              splashRadius: 10,
                            ),
                          ),
                        ],
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                'New Roommate Matches',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.green[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Switch(
                              value: roommate,
                              onChanged: (value) {
                                setState(() {
                                  roommate = value;
                                });
                              },
                              activeTrackColor: Colors.green[800],
                              activeColor: Colors.white,
                              splashRadius: 10,
                            ),
                          ),
                        ],
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                'Messages',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.green[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Switch(
                              value: messages,
                              onChanged: (value) {
                                setState(() {
                                  messages = value;
                                });
                              },
                              activeTrackColor: Colors.green[800],
                              activeColor: Colors.white,
                              splashRadius: 10,
                            ),
                          ),
                        ],
                      ),
                      CustomSpacer(flex: 1),
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
