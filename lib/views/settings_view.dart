import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:bunkie/views/edit_profile_view.dart';
import 'package:bunkie/views/notifications_settings_view.dart';
import 'package:bunkie/views/views.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';

import 'shared/custom_spacer.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
            'Settings',
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
              locator<NavigationService>().pushNamed(LookingForRoommateViewRoute);
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/landing-page-background.jpg'),
                              radius: 25,
                            ),
                            CustomSpacer(flex: 1, horizontal: true),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Text(
                                  'James Bond',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 27,
                              color: Colors.green[800],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: GestureDetector(
                                  onTap: () {
                                    locator<NavigationService>()
                                        .pushNamed(EditProfileViewRoute);
                                  },
                                  child: Text(
                                    'Edit Profile',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.verified_user_rounded,
                              size: 27,
                              color: Colors.green[800],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  'Verification',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.addchart_rounded,
                              size: 27,
                              color: Colors.green[800],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  'Preferences',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.security_rounded,
                              size: 27,
                              color: Colors.green[800],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  'Privacy and Security',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications_active,
                              size: 27,
                              color: Colors.green[800],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: GestureDetector(
                                  onTap: () {
                                    locator<NavigationService>().pushNamed(
                                        NotificationsSettingsViewRoute);
                                  },
                                  child: Text(
                                    'Notification Settings',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.supervised_user_circle,
                              size: 27,
                              color: Colors.green[800],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  'Invite Friends',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.help_outline_outlined,
                              size: 27,
                              color: Colors.green[800],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: GestureDetector(
                                  onTap: () {
                                    locator<NavigationService>()
                                        .pushNamed(HelpViewRoute);
                                  },
                                  child: Text(
                                    'Help',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              size: 27,
                              color: Colors.green[800],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  'Log out',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 27,
                              color: Colors.green[800],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  'Delete Account',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
