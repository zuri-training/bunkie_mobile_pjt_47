import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/custom_spacer.dart';

class UserVerificationView extends StatefulWidget {
  const UserVerificationView({Key? key}) : super(key: key);

  @override
  _UserVerificationViewState createState() => _UserVerificationViewState();
}

class _UserVerificationViewState extends State<UserVerificationView> {
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
          leading: GestureDetector(
            onTap: () => locator<NavigationService>().goBack(),
            child: Container(
              height: 15.h,
              width: 6.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(
                  color: Colors.green.withAlpha(90),
                  blurRadius: 2,
                )],
              ),
              child: Icon(
                Icons.arrow_back,
                size: 25.w
              ),
            ),
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
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'To ensure the safety of every bunkie, we advise that you verify your account. It is easy and secure.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 1),
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
                                  color: Colors.black,
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
                      Divider(color: Colors.black, thickness: 0.4),
                      CustomSpacer(flex: 5),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'Basic Info',
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
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: GoogleFonts.cabin(),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      labelText: 'First Name',
                                      labelStyle: GoogleFonts.cabin(),
                                      hintStyle: GoogleFonts.cabin(),
                                      hintText: 'First Name'),
                                ),
                              ),
                              CustomSpacer(flex: 4, horizontal: true),
                              Expanded(
                                child: TextFormField(
                                  style: GoogleFonts.cabin(),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      labelText: 'Last Name',
                                      labelStyle: GoogleFonts.cabin(),
                                      hintStyle: GoogleFonts.cabin(),
                                      hintText: 'Last Name'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 3),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: GoogleFonts.cabin(),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      labelText: 'Middle Name(optional)',
                                      labelStyle: GoogleFonts.cabin(),
                                      hintStyle: GoogleFonts.cabin(),
                                      hintText: 'Middle Name'),
                                ),
                              ),
                              CustomSpacer(flex: 4, horizontal: true),
                              Expanded(
                                child: TextFormField(
                                  style: GoogleFonts.cabin(),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.arrow_drop_down),
                                      ),
                                      labelText: 'Date of Birth',
                                      labelStyle: GoogleFonts.cabin(),
                                      hintStyle: GoogleFonts.cabin(),
                                      hintText: 'dd/mm/yyyy'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 6),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Address',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          child: TextFormField(
                            style: GoogleFonts.cabin(),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 2),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          child: TextFormField(
                            decoration: InputDecoration(
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
                                icon: Icon(Icons.arrow_drop_down),
                              ),
                              labelText: 'State',
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(flex: 3),
                      CustomButton(
                        text: 'Continue',
                        onPressed: () {
                          locator<NavigationService>()
                              .pushNamed(UserDocumentVerificationViewRoute);
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
