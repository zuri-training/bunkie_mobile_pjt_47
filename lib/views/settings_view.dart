import 'dart:developer';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/custom_spacer.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  AuthService _authService = AuthService();
  FireStoreService _fireStoreService = FireStoreService();
  User? loggedInUser;
  String? lastname;
  @override
  void initState() {
    loggedInUser = _authService.currentUser();
    log(loggedInUser!.uid);
    super.initState();
  }

  bool allow = true;
  bool sound = true;
  bool roommate = true;
  bool messages = true;
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      onWillPop: () => locator<NavigationService>().popAndPushNamed(
        LookingForRoommateViewRoute
      ),
      builder: (context, size) {
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
              locator<NavigationService>()
                  .pushReplacementNamed(LookingForRoommateViewRoute);
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: FutureBuilder<dynamic>(
                                      future: _fireStoreService
                                          .getUserFirstAndLastName(
                                              loggedInUser!.uid),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          log('User is null');
                                          return Text('User is null');
                                        }
                                        lastname = snapshot.data.toString();
                                        return Text(
                                          '$lastname',
                                          style: GoogleFonts.cabin(
                                              textStyle: TextStyle(
                                                  fontSize: 28.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        );
                                      })),
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
                                child: GestureDetector(
                                  onTap: () {
                                    locator<NavigationService>()
                                        .pushNamed(UserVerificationViewRoute);
                                  },
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
