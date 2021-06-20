import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:bunkie/views/shared/shared.dart';

class LandingPageView extends StatelessWidget {
  const LandingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Scaffold(
        body: Stack(children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.green.shade200,
                    Colors.transparent,
                  ],
                  stops: [
                    1,
                    1
                  ]).createShader(bounds);
            },
            blendMode: BlendMode.modulate,
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/landing-page-background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(children: [
            Container(
              width: 180.w,
              height: 120.h,
              child: Image.asset('assets/images/white-bunkie-logo.png'),
            ),
            CustomSpacer(flex: size.height / 18),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Text(
                  'Need a perfect roommate in your school? Join millions of students who find theirs with Bunkie',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 21.sp)),
            ),
            CustomSpacer(
              flex: 25,
            ),
            CustomButton(
                text: 'Get Started',
                onPressed: () {
                  locator<NavigationService>().pushNamed(LoginViewRoute);
                }),
          ])
        ]),
      );
    });
  }
}
