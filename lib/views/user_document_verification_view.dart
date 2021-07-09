import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';


import 'shared/custom_spacer.dart';

class UserDocumentVerificationView extends StatefulWidget {
  const UserDocumentVerificationView({Key? key}) : super(key: key);

  @override
  _UserDocumentVerificationViewState createState() =>
      _UserDocumentVerificationViewState();
}

class _UserDocumentVerificationViewState
    extends State<UserDocumentVerificationView> {
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
                            'Upload Student ID or Admission Letter.(pdf, jpg, jpeg or png)',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 4),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 90.w),
                        child: Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: 40),
                            child: TextFormField(
                              style: GoogleFonts.cabin(),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(25.w),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(25.w),
                                ),
                                suffixIcon: IconButton(
                                  alignment: Alignment.topRight,
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_drop_down),
                                ),
                                hintText: 'Student ID',
                                hintStyle: GoogleFonts.cabin(),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 2),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 90.w),
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: 40),
                            child: TextFormField(
                              style: GoogleFonts.cabin(),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightGreen),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightGreen),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.cancel_outlined),
                                    color: Colors.red,
                                  ),
                                  hintStyle: GoogleFonts.cabin(),
                                  hintText: 'James Bond ID'),
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      size: 20,
                                      color: Colors.green[800],
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: GestureDetector(
                                        onTap: () {
                                          locator<NavigationService>().pushNamed(
                                              UserDocumentVerificationViewRoute);
                                        },
                                        child: Text(
                                          'Take Photo',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.cabin(
                                            fontSize: 13.sp,
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
                          CustomSpacer(flex: 7, horizontal: true),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.upload_file,
                                    size: 20,
                                    color: Colors.green[800],
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        locator<NavigationService>().pushNamed(
                                            UserDocumentVerificationViewRoute);
                                      },
                                      child: Text(
                                        'Upload',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cabin(
                                          fontSize: 13.sp,
                                          color: Colors.green[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomSpacer(flex: 5),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 3),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'Upload National ID/Passport/Drivers License(pdf, jpg, jpeg or png)',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 4),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 90.w),
                        child: Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: 40),
                            child: TextFormField(
                              style: GoogleFonts.cabin(),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(25.w),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(25.w),
                                ),
                                suffixIcon: IconButton(
                                  alignment: Alignment.topRight,
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_drop_down),
                                ),
                                hintText: 'Passport',
                                hintStyle: GoogleFonts.cabin(),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 2),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 90.w),
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: 40),
                            child: TextFormField(
                              style: GoogleFonts.cabin(),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightGreen),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightGreen),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.cancel_outlined),
                                    color: Colors.red,
                                  ),
                                  hintStyle: GoogleFonts.cabin(),
                                  hintText: 'James Passport'),
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      size: 20,
                                      color: Colors.green[800],
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: GestureDetector(
                                        onTap: () {
                                          locator<NavigationService>().pushNamed(
                                              UserDocumentVerificationViewRoute);
                                        },
                                        child: Text(
                                          'Take Photo',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.cabin(
                                            fontSize: 13.sp,
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
                          CustomSpacer(flex: 7, horizontal: true),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.upload_file,
                                    size: 20,
                                    color: Colors.green[800],
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        locator<NavigationService>().pushNamed(
                                            UserDocumentVerificationViewRoute);
                                      },
                                      child: Text(
                                        'Upload',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cabin(
                                          fontSize: 13.sp,
                                          color: Colors.green[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomSpacer(flex: 5),
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 3),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'Verify Address',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 2),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'Upload a Utility Bill or Bank Statement that clearly shows your address(pdf, jpg, jpeg or png)',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 4),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 90.w),
                        child: Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: 40),
                            child: TextFormField(
                              style: GoogleFonts.cabin(),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(25.w),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(25.w),
                                ),
                                suffixIcon: IconButton(
                                  alignment: Alignment.topRight,
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_drop_down),
                                ),
                                hintStyle: GoogleFonts.cabin(),
                                hintText: 'Utility Bill',
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 2),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 90.w),
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: 40),
                            child: TextFormField(
                              style: GoogleFonts.cabin(),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightGreen),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightGreen),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.cancel_outlined),
                                    color: Colors.red,
                                  ),
                                  hintStyle: GoogleFonts.cabin(),
                                  hintText: 'Utility Bill'),
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      size: 20,
                                      color: Colors.green[800],
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: GestureDetector(
                                        onTap: () {
                                          locator<NavigationService>().pushNamed(
                                              UserDocumentVerificationViewRoute);
                                        },
                                        child: Text(
                                          'Take Photo',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.cabin(
                                            fontSize: 13.sp,
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
                          CustomSpacer(flex: 7, horizontal: true),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.upload_file,
                                    size: 20,
                                    color: Colors.green[800],
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        locator<NavigationService>().pushNamed(
                                            UserDocumentVerificationViewRoute);
                                      },
                                      child: Text(
                                        'Upload',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cabin(
                                          fontSize: 13.sp,
                                          color: Colors.green[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomSpacer(flex: 7),
                      CustomButton(
                        text: 'Continue',
                        onPressed: () {
                          locator<NavigationService>()
                              .pushNamed(LiveShotVerificationViewRoute);
                        },
                      ),
                      CustomSpacer(flex: 3),
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
