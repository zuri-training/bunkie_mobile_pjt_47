import 'dart:developer';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:bunkie/views/shared/full_name_stream.dart';
import 'package:bunkie/views/verify_email_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/custom_spacer.dart';

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  AuthService _authService = AuthService();
  User? loggedInUser;

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
        onWillPop: () => locator<NavigationService>().goBack(),
        builder: (context, size) {
          return Scaffold(
            appBar: AppBar(
                title: Text(
                  'Menu',
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withAlpha(90),
                          blurRadius: 2,
                        )
                      ],
                    ),
                    child: Icon(Icons.arrow_back, size: 25.w),
                  ),
                )),
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
                                // CustomSpacer(flex: 0, horizontal: true),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: FullNameStream(
                                        loggedInUser: loggedInUser!,
                                        style: GoogleFonts.cabin(
                                            textStyle: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      )),
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
                                  Icons.home,
                                  size: 27,
                                  color: Colors.green[800],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        locator<NavigationService>()
                                            .pushNamed(SelectionViewRoute);
                                      },
                                      child: Text(
                                        'Home',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cabin(
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
                                  Icons.question_answer,
                                  size: 27,
                                  color: Colors.green[800],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Text(
                                      'FAQs',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cabin(
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
                                GestureDetector(
                                  onTap: () {
                                    locator<NavigationService>()
                                        .pushNamed(HelpViewRoute);
                                  },
                                  child: Icon(
                                    Icons.help_outline_outlined,
                                    size: 27,
                                    color: Colors.green[800],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        locator<NavigationService>()
                                            .pushNamed(HelpViewRoute);
                                      },
                                      child: Text(
                                        'Help & Support',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cabin(
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
                                GestureDetector(
                                  onTap: () {
                                    locator<NavigationService>()
                                        .pushNamed(SettingsViewRoute);
                                  },
                                  child: Icon(
                                    Icons.settings,
                                    size: 27,
                                    color: Colors.green[800],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        locator<NavigationService>()
                                            .pushNamed(SettingsViewRoute);
                                      },
                                      child: Text(
                                        'Settings',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cabin(
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
                                  Icons.visibility_off_outlined,
                                  size: 27,
                                  color: Colors.green[800],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        locator<NavigationService>().pushNamed(
                                            NotificationsSettingsViewRoute);
                                      },
                                      child: Text(
                                        'TurnOff Visibility',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cabin(
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Text(
                                      'Invite Friends',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cabin(
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
                                  Icons.logout,
                                  size: 27,
                                  color: Colors.green[800],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        _authService.signOut();
                                        locator<NavigationService>().popAndPushNamed(LoginViewRoute);
                                      },
                                      child: Text(
                                        'Log out',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cabin(
                                          fontSize: 17.sp,
                                          color: Colors.green[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )    
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Text(
                                      'Delete Account',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cabin(
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
