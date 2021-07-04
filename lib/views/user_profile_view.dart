import 'dart:developer';

import 'package:bunkie/services/auth_service.dart';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/views/shared/custom_button.dart';
import 'package:bunkie/views/shared/custom_spacer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/responsive_widget.dart';
import 'package:bunkie/utils/utils.dart';

class UserProfileView extends StatefulWidget {
  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final List<Widget> _children = [];

  final AuthService _auth = AuthService();
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
    return ResponsiveWidget(onWillPop: () {
      locator<NavigationService>().pushNamed(LandingViewRoute);
    }, builder: (context, size) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/HsTope.png'),
              fit: BoxFit.none,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                CustomSpacer(flex: 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            locator<NavigationService>().goBack();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          locator<NavigationService>().pushNamed(MenuViewRoute);
                        },
                        child:
                            Icon(Icons.menu, color: Colors.white, size: 35.0),
                      ),
                    ],
                  ),
                ),
                CustomSpacer(flex: 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/landing-page-background.jpg'),
                        radius: 25,
                      ),
                      CustomSpacer(flex: 2),
                      Container(
                        alignment: Alignment.topLeft,
                        child: FutureBuilder<dynamic>(
                            future: _fireStoreService
                                .getUserFirstAndLastName(loggedInUser!.uid),
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
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal)),
                              );
                            }),
                      ),
                      CustomSpacer(flex: 2),
                      Container(
                        child: Text(
                          'About:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Container(
                        child: Text(
                          'I am not complicated. As a matter of fact, i believe in the simplicity of all things and this enables me take life one step at a time while doing my best to keep everything simple',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 20),
                      Container(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.add_circle_outline,
                            color: Colors.black, size: 30),
                      ),
                      CustomSpacer(flex: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 120.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/landing-page-background.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            CustomSpacer(flex: 4, horizontal: true),
                            Container(
                              height: 120.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/landing-page-background.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(flex: 6),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[200],
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items: [
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    locator<NavigationService>().pushNamed(SelectionViewRoute);
                  },
                  child: Icon(Icons.house)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    locator<NavigationService>()
                        .pushNamed(UserProfileViewRoute);
                  },
                  child: Icon(Icons.person)),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(onTap: () {}, child: Icon(Icons.mail)),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {}, child: Icon(Icons.notifications)),
              label: 'Notifications',
            ),
          ],
        ),
      );
    });
  }
}
