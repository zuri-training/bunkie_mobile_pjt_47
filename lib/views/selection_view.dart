import 'dart:developer';
import 'package:bunkie/services/auth_service.dart';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/views/shared/custom_spacer.dart';
import 'package:bunkie/views/shared/full_name_stream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'shared/navigation_bar.dart';
import 'shared/responsive_widget.dart';
import 'package:bunkie/utils/utils.dart';

class SelectionView extends StatefulWidget {
  @override
  _SelectionViewState createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> {
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
                  CustomSpacer(flex: 3),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/landing-page-background.jpg'),
                              radius: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                locator<NavigationService>()
                                    .pushNamed(MenuViewRoute);
                              },
                              child: Icon(Icons.menu,
                                  color: Colors.white, size: 35.0.w),
                            ),
                          ],
                        ),
                        CustomSpacer(flex: 2),
                        Container(
                          child: Text(
                            'Welcome to Bunkie',
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
                          alignment: Alignment.topLeft,
                          child: FullNameStream(
                            loggedInUser: loggedInUser!,
                            style: GoogleFonts.cabin(
                                textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal)),
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomSpacer(flex: 40),
                  Container(
                    child: SizedBox(
                      height: 70.h,
                      width: 220.w,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.supervised_user_circle_sharp,
                          color: Colors.white,
                          size: 23.0,
                        ),
                        label: Text(
                          'I need a Roommate',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),

                        onPressed: () {
                          locator<NavigationService>()
                              .pushNamed(SearchViewRoute);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[800],
                          // padding: EdgeInsets.symmetric(
                          //    horizontal: 30.h, vertical: 20.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.h),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomSpacer(flex: 5),
                  Container(
                    child: SizedBox(
                      height: 70.h,
                      width: 220.w,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.house,
                          color: Colors.white,
                          size: 23.0,
                        ),
                        label: Text('I need a Room'),
                        onPressed: () {
                          locator<NavigationService>()
                              .pushNamed(SearchRoomViewRoute);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[800],
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: 40.h, vertical: 20.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.h),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomSpacer(flex: 2),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavBar());
    });
  }
}
