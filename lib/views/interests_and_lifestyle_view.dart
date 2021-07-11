
import 'package:bunkie/views/shared/interest_button.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:flutter/material.dart';

import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class InterestsAndLifeStyleView extends StatefulWidget {
  const InterestsAndLifeStyleView({Key? key}) : super(key: key);

  @override
  _InterestsAndLifeStyleViewState createState() =>
      _InterestsAndLifeStyleViewState();
}

class _InterestsAndLifeStyleViewState extends State<InterestsAndLifeStyleView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        onWillPop: () => locator<NavigationService>().goBack(),
        builder: (context, size) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'Interests and Lifestyle',
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
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w, top: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      locator<NavigationService>()
                          .pushNamed(AmenitiesViewRoute);
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(children: [
                CustomSpacer(flex: 3),
                Text(
                    'Select your most preferred interests',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                        color: Colors.black, fontSize: 16.sp)),
                CustomSpacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterestButton(
                          text: 'Music',
                        ),
                        InterestButton(text: 'Gaming'),
                        InterestButton(text: 'Cooking'),
                        InterestButton(text: 'Sports'),
                      ]),
                ),
                CustomSpacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterestButton(
                          text: 'Pets',
                        ),
                        InterestButton(text: 'Travel'),
                        InterestButton(text: 'Food'),
                        InterestButton(text: 'Politics'),
                      ]),
                ),
                CustomSpacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterestButton(
                          text: 'Books',
                        ),
                        InterestButton(text: 'Movies'),
                        InterestButton(text: 'Writing'),
                        InterestButton(text: 'Dance'),
                      ]),
                ),
                CustomSpacer(flex: 3),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Lifestyle',
                        style: GoogleFonts.cabin(
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      )),
                ),
                CustomSpacer(flex: 1),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Text('Select tags that describe your lifestyle',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.cabin(
                              color: Colors.black, fontSize: 15.sp)),
                    )),
                CustomSpacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InterestButton(
                          text: 'Introvert',
                        ),
                        InterestButton(text: 'Extrovert', width: 80.w),
                        InterestButton(text: 'Neat Freak', width: 95.w),
                      ]),
                ),
                CustomSpacer(
                  flex: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InterestButton(
                          text: 'Gym Rat',
                        ),
                        InterestButton(text: 'Nerd'),
                        InterestButton(text: 'Party Animal', width: 95.w),
                      ]),
                ),
                CustomSpacer(flex: 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InterestButton(
                          text: 'Quiet',
                        ),
                        InterestButton(text: 'Non-smoker', width: 95.w),
                        InterestButton(text: 'Smoker'),
                      ]),
                ),
                CustomSpacer(flex: 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InterestButton(text: 'Independent', width: 95.w),
                        InterestButton(text: 'Night Owl', width: 80.w),
                        InterestButton(text: 'Drinker'),
                      ]),
                ),
                CustomSpacer(flex: 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InterestButton(text: 'Love Sharing', width: 95.w),
                        // InterestButton(text: 'Extrovert', width: 80.w),
                        InterestButton(text: 'Playful'),
                      ]),
                ),
                CustomSpacer(flex: 4),
                CustomButton(
                  text: 'Submit',
                  onPressed: () {
                    locator<NavigationService>().pushNamed(AmenitiesViewRoute);
                  },
                ),
                CustomSpacer(flex: 6)
              ]),
            )),
          );
        });
  }
}
