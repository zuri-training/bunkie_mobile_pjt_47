import 'dart:async';

import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'shared/shared.dart';

class CodeVerificationView extends StatefulWidget {
  const CodeVerificationView({Key? key}) : super(key: key);

  @override
  _CodeVerificationViewState createState() => _CodeVerificationViewState();
}

class _CodeVerificationViewState extends State<CodeVerificationView> {
  TextEditingController _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? _errorController;

  bool _hasError = false;
  @override
  void initState() {
    _errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    _errorController!.close();

    super.dispose();
  }

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
                  height: 230.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/verification/verify-phone.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                CustomSpacer(flex: 8),
                Text('Code Verification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w800)),
                CustomSpacer(
                  flex: 2,
                ),
                Text(
                  'Enter your verification code',
                  style: TextStyle(fontSize: 16.sp),
                ),
                CustomSpacer(
                  flex: 5,
                ),
                PinCodeFields(
                    hasError: _hasError,
                    errorController: _errorController!,
                    controller: _controller,
                    validator: (val) {
                      if (val.length < 6) {
                        return '';
                      }
                      return null;
                    }),
                CustomSpacer(
                  flex: 3,
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't Receive the Code?  ",
                          style: TextStyle(fontSize: 17.sp),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: GestureDetector(
                            onTap: () {
                              locator<NavigationService>()
                                  .pushNamed(SignUpViewRoute);
                            },
                            child: Text(
                              'Resend Code',
                              style: TextStyle(
                                  color: Colors.lightGreen, fontSize: 17.sp),
                            ),
                          )
                        )
                        
                      ]),
                ),
                CustomSpacer(
                  flex: 5,
                ),
                CustomButton(
                    width: size.width,
                    text: 'Verify',
                    onPressed: () {
                      locator<NavigationService>()
                          .pushNamed(ProfileCreateViewRoute);
                    }),
              ]),
            ),
          ),
        ),
      );
    });
  }
}
