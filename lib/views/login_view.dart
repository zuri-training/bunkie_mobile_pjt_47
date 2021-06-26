import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 120.h,
                      child: Image.asset(
                          'assets/images/bunkie-logos/gradient-bunkie-logo.png'),
                    ),
                    CustomSpacer(flex: 4,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text('Log In to Continue',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                            )),
                      ),
                    ),
                    CustomSpacer(flex: 4),
                    CustomTextFormField(
                      hintText: 'Enter Email',
                    ),
                    CustomSpacer(flex: 5),
                    CustomTextFormField(
                      hintText: 'Enter Password',
                    ),
                    CustomSpacer(flex: 8),
                    CustomButton(
                        text: 'Log In',
                        onPressed: () {
                          locator<NavigationService>()
                              .pushNamed(VerifyNumberViewRoute);
                        }),
                    CustomSpacer(flex: 4),
                    Text('Or continue with:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        )),
                    CustomSpacer(flex: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialMediaButton(
                          label: 'Facebook',
                          imagePath: 'assets/images/logo-facebook.png',
                        ),
                        CustomSpacer(horizontal: true, flex: 3),
                        SocialMediaButton(
                            label: 'Google',
                            imagePath: 'assets/images/logo-google.png'),
                      ],
                    ),
                    CustomSpacer(flex: 7),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?  ",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                            GestureDetector(
                              onTap: () {
                                locator<NavigationService>()
                                    .pushNamed(SignUpViewRoute);
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.lightBlue, fontSize: 17.sp),
                              ),
                            )
                          ]),
                    )
                  ],
                )),
          ),
        ),
      );
    });
  }
}
