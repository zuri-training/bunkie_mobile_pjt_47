import 'dart:developer';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:bunkie/views/shared/full_name_stream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/custom_spacer.dart';

class UserMessagesView extends StatefulWidget {
  @override
  _UserMessagesViewState createState() => _UserMessagesViewState();
}

class _UserMessagesViewState extends State<UserMessagesView> {
  AuthService _authService = AuthService();
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
        onWillPop: () => locator<NavigationService>().goBack(),
        builder: (context, size) {
          return Scaffold(
            appBar: AppBar(
                title: Text(
                  'Messages',
                  style: TextStyle(
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
                          CustomSpacer(flex: 2),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/landing-page-background.jpg'),
                                  radius: 20,
                                ),
                                // CustomSpacer(flex: 0, horizontal: true),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FullNameStream(
                                          loggedInUser: loggedInUser!,
                                          style: GoogleFonts.cabin(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      text:
                                                          'Hello, I am looking for a roommate, are you available?'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //CustomSpacer(flex: 7, horizontal: true),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('6:40 AM',
                                        style: GoogleFonts.cabin(
                                            fontSize: 10, color: Colors.black)),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(2.0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty.all(
                                                CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(4))),
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomSpacer(flex: 0),
                          Divider(color: Colors.black, thickness: 0.4),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/landing-page-background.jpg'),
                                  radius: 20,
                                ),
                                // CustomSpacer(flex: 0, horizontal: true),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FullNameStream(
                                          loggedInUser: loggedInUser!,
                                          style: GoogleFonts.cabin(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      text:
                                                          'I would like to take the room you have available'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //CustomSpacer(flex: 7, horizontal: true),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('4:40 AM',
                                        style: GoogleFonts.cabin(
                                            fontSize: 10, color: Colors.black)),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(2.0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty.all(
                                                CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(4))),
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomSpacer(flex: 0),
                          Divider(color: Colors.black, thickness: 0.4),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/landing-page-background.jpg'),
                                  radius: 20,
                                ),
                                // CustomSpacer(flex: 0, horizontal: true),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FullNameStream(
                                          loggedInUser: loggedInUser!,
                                          style: GoogleFonts.cabin(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      text:
                                                          'Hello, I saw you needed a roommate, can we meet up?'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //CustomSpacer(flex: 7, horizontal: true),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('2:40 AM',
                                        style: GoogleFonts.cabin(
                                            fontSize: 10, color: Colors.black)),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(2.0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty.all(
                                                CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(4))),
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomSpacer(flex: 0),
                          Divider(color: Colors.black, thickness: 0.4),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/landing-page-background.jpg'),
                                  radius: 20,
                                ),
                                // CustomSpacer(flex: 0, horizontal: true),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        StreamBuilder(
                                            stream: locator<FireStoreService>()
                                                .getUserFirstAndLastName(
                                                    loggedInUser!.uid),
                                            builder: (context,
                                                AsyncSnapshot snapshot) {
                                              if (!snapshot.hasData) {
                                                log('User is null');
                                                return Text('User is null');
                                              }
                                              lastname =
                                                  snapshot.data.toString();
                                              return Text(
                                                '$lastname',
                                                style: GoogleFonts.cabin(
                                                    textStyle: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              );
                                            }),
                                        Container(
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      text:
                                                          'Hello, I am looking for a roommate, are you available?'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //CustomSpacer(flex: 7, horizontal: true),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('1:25 AM',
                                        style: GoogleFonts.cabin(
                                            fontSize: 10, color: Colors.black)),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(2.0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty.all(
                                                CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(4))),
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomSpacer(flex: 0),
                          Divider(color: Colors.black, thickness: 0.4),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/landing-page-background.jpg'),
                                  radius: 20,
                                ),
                                // CustomSpacer(flex: 0, horizontal: true),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FullNameStream(
                                          loggedInUser: loggedInUser!,
                                          style: GoogleFonts.cabin(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      text:
                                                          'How soon can we meet up?'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //CustomSpacer(flex: 7, horizontal: true),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('6:40 AM',
                                        style: GoogleFonts.cabin(
                                            fontSize: 10, color: Colors.black)),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(2.0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty.all(
                                                CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(4))),
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomSpacer(flex: 0),
                          Divider(color: Colors.black, thickness: 0.4),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/landing-page-background.jpg'),
                                  radius: 20,
                                ),
                                // CustomSpacer(flex: 0, horizontal: true),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FullNameStream(
                                          loggedInUser: loggedInUser!,
                                          style: GoogleFonts.cabin(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      text:
                                                          'Hello, I am looking for a roommate, are you available?'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //CustomSpacer(flex: 7, horizontal: true),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('6:40 AM',
                                        style: GoogleFonts.cabin(
                                            fontSize: 10, color: Colors.black)),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(2.0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty.all(
                                                CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(4))),
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomSpacer(flex: 0),
                          Divider(color: Colors.black, thickness: 0.4),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/landing-page-background.jpg'),
                                  radius: 20,
                                ),
                                // CustomSpacer(flex: 0, horizontal: true),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FullNameStream(
                                          loggedInUser: loggedInUser!,
                                          style: GoogleFonts.cabin(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      text:
                                                          'I would like to take the room you have available'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //CustomSpacer(flex: 7, horizontal: true),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('4:40 AM',
                                        style: GoogleFonts.cabin(
                                            fontSize: 10, color: Colors.black)),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(2.0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty.all(
                                                CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(4))),
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomSpacer(flex: 0),
                          Divider(color: Colors.black, thickness: 0.4),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/landing-page-background.jpg'),
                                  radius: 20,
                                ),
                                // CustomSpacer(flex: 0, horizontal: true),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FullNameStream(
                                          loggedInUser: loggedInUser!,
                                          style: GoogleFonts.cabin(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      text:
                                                          'Hello, I saw you needed a roommate, can we meet up?'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //CustomSpacer(flex: 7, horizontal: true),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('2:40 AM',
                                        style: GoogleFonts.cabin(
                                            fontSize: 10, color: Colors.black)),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(2.0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty.all(
                                                CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(4))),
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomSpacer(flex: 0),
                          Divider(color: Colors.black, thickness: 0.4),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/landing-page-background.jpg'),
                                  radius: 20,
                                ),
                                // CustomSpacer(flex: 0, horizontal: true),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FullNameStream(
                                          loggedInUser: loggedInUser!,
                                          style: GoogleFonts.cabin(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      text:
                                                          'Hello, I am looking for a roommate, are you available?'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //CustomSpacer(flex: 7, horizontal: true),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('1:25 AM',
                                        style: GoogleFonts.cabin(
                                            fontSize: 10, color: Colors.black)),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(2.0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty.all(
                                                CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(4))),
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomSpacer(flex: 0),
                          Divider(color: Colors.black, thickness: 0.4),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/landing-page-background.jpg'),
                                  radius: 20,
                                ),
                                // CustomSpacer(flex: 0, horizontal: true),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FullNameStream(
                                          loggedInUser: loggedInUser!,
                                          style: GoogleFonts.cabin(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      text:
                                                          'How soon can we meet up?'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //CustomSpacer(flex: 7, horizontal: true),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('6:40 AM',
                                        style: GoogleFonts.cabin(
                                            fontSize: 10, color: Colors.black)),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(2.0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty.all(
                                                CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(4))),
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomSpacer(flex: 0),
                          Divider(color: Colors.black, thickness: 0.4),
                          CustomSpacer(flex: 3)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavBar(),
          );
        });
  }
}
