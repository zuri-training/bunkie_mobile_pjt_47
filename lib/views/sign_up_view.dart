import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 120.h,
                      child: Image.asset(
                          'assets/images/bunkie-logos/gradient-bunkie-logo.png'),
                    ),
                    CustomSpacer(flex: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Create an account',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                          )),
                    ),
                    CustomSpacer(flex: 4),
                    CustomTextFormField(
                      hintText: 'Full Name',
                    ),
                    CustomSpacer(flex: 5),
                    CustomTextFormField(
                      hintText: 'Enter Email',
                    ),
                    CustomSpacer(flex: 5),
                    CustomTextFormField(
                      hintText: 'Enter Password',
                    ),
                    CustomSpacer(flex: 10),
                    CustomButton(
                        text: 'Sign Up',
                        onPressed: () {
                          locator<NavigationService>()
                              .pushNamed(VerifyEmailViewRoute);
                        }),
                    CustomSpacer(flex: 4),
                    Text('Or register with:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        )),
                    CustomSpacer(flex: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialMediaButton(
                            label: 'Facebook',
                            imagePath: 'assets/images/logo-facebook.png'),
                        CustomSpacer(horizontal: true, flex: 3),
                        SocialMediaButton(
                            label: 'Google',
                            imagePath: 'assets/images/logo-google.png'),
                      ],
                    ),
                    CustomSpacer(flex: 3),
                    SizedBox(height: 20),
                  ],
                )),
          ),
        ),
      );
    });
  }
}
