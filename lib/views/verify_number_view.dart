import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';

import 'shared/shared.dart';

class VerifyNumberView extends StatelessWidget {
  const VerifyNumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              width: size.width,
              height: size.height,
              child: Column(children: [
                CustomSpacer(
                  flex: 5,
                ),
                Container(
                  width: 200.w,
                  height: 234.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/verify-man.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                CustomSpacer(flex: 7),
                Text('Mobile Verification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w800)),
                CustomSpacer(
                  flex: 5,
                ),
                Text(
                  'Enter your phone number',
                  style: TextStyle(fontSize: 16.sp),
                ),
                CustomSpacer(
                  flex: 5,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Color(0xff027A63),
                  cursorWidth: 4,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      focusColor: Color(0xff027A63),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff027A63)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff027A63)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff027A63)),
                      ),
                      fillColor: Colors.white,
                      filled: false,
                      hintText: '+234 8067XXXXXX',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 24.sp,
                      )),
                ),
                CustomSpacer(
                  flex: 10,
                ),
                CustomButton(
                    width: size.width,
                    text: 'Send verification code',
                    onPressed: () {
                      locator<NavigationService>()
                          .pushNamed(CodeVerificationViewRoute);
                    }),
              ]),
            ),
          ),
        ),
      );
    });
  }
}
