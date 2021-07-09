import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/custom_spacer.dart';

class LiveShotVerificationView extends StatefulWidget {
  const LiveShotVerificationView({Key? key}) : super(key: key);

  @override
  _LiveShotVerificationViewState createState() =>
      _LiveShotVerificationViewState();
}

class _LiveShotVerificationViewState extends State<LiveShotVerificationView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      onWillPop: () => locator<NavigationService>().goBack(),
      builder: (context, size) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Verification',
            style: GoogleFonts.cabin(
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
                        padding: EdgeInsets.symmetric(horizontal: 60.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(
                                      2.0
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.green
                                    ),
                                    shape: MaterialStateProperty.all(
                                      CircleBorder()
                                    ),
                                  ),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 60.w,
                                child: Container(
                                  height: 2.w,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(
                                      2.0
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.green
                                    ),
                                    shape: MaterialStateProperty.all(
                                      CircleBorder()
                                    ),
                                  ),
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 60.w,
                                child: Container(
                                  height: 2.w,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(
                                      2.0
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.green
                                    ),
                                    shape: MaterialStateProperty.all(
                                      CircleBorder()
                                    ),
                                  ),
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'Verifying your identity would increase your chances of getting a roommate by 10x',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 2),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 3),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'Live Photo',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 3),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'We need to take a Live Photo of you',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.closed_caption_disabled_outlined,
                                size: 100,
                                color: Colors.green[800],
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'Don\'t Use Filters',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cabin(
                                    fontSize: 12.sp,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CustomSpacer(flex: 8, horizontal: true),
                          Column(
                            children: [
                              Icon(
                                Icons.visibility_off_outlined,
                                size: 100,
                                color: Colors.green[800],
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'Don\'t wear eye glasses',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cabin(
                                    fontSize: 12.sp,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomSpacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.wb_sunny_outlined,
                                size: 100,
                                color: Colors.green[800],
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'Use enough Sunlight',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cabin(
                                    fontSize: 12.sp,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CustomSpacer(flex: 8, horizontal: true),
                          Column(
                            children: [
                              Icon(
                                Icons.cancel_outlined,
                                size: 100,
                                color: Colors.green[800],
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'Don\'t wear a hat',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cabin(
                                    fontSize: 12.sp,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomSpacer(flex: 5),
                      CustomSpacer(flex: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  size: 25,
                                  color: Colors.green[800],
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () {
                                      locator<NavigationService>().pushNamed(
                                          LiveShotVerificationViewRoute);
                                    },
                                    child: Text(
                                      'Take Photo',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cabin(
                                        fontSize: 18.sp,
                                        color: Colors.green[800],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CustomSpacer(flex: 7),
                      CustomButton(
                        text: 'Done',
                        onPressed: () {
                          locator<NavigationService>()
                              .pushNamed(SettingsViewRoute);
                        },
                      ),
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
