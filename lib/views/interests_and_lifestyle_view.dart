import 'package:bunkie/views/shared/interest_button.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:flutter/material.dart';

import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';


class InterestsAndLifeStyleView extends StatefulWidget {
  const InterestsAndLifeStyleView({Key? key}): super(key: key);

  @override
  _InterestsAndLifeStyleViewState createState() => _InterestsAndLifeStyleViewState();
}


class _InterestsAndLifeStyleViewState extends State<InterestsAndLifeStyleView> {

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (context, size) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomSpacer(flex: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 30.w,
                          width: 40.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                            size: 30.w
                          )
                        )
                      ),
                      GestureDetector(
                        onTap: () {
                          locator<NavigationService>()
                            .pushNamed(RoommatePreferencesViewRoute);
                        },
                        child: Text(
                          'Next',
                          style: GoogleFonts.cabin(
                            color: Color(0xff027A63),
                            fontSize: 20.sp
                          ),
                        )
                      ),
                    ]
                  ),
                ),
                Text(
                  'Almost there',
                  style: GoogleFonts.cabin(
                    fontSize: 25.sp,
                    color: Colors.grey
                  )
                ),
                CustomSpacer(flex: 3),
                Text(
                  'Tell us your interests, we\'ll find roommates \nwith the same interests as you',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cabin(
                    color: Colors.grey,
                    fontSize: 16.sp
                  )
                ),
                CustomSpacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterestButton(text: 'Music',),
                      InterestButton(text: 'Gaming'),
                      InterestButton(text: 'Cooking'),
                      InterestButton(text: 'Sports'),
                    ]
                  ),
                ),
                CustomSpacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterestButton(text: 'Pets',),
                      InterestButton(text: 'Travel'),
                      InterestButton(text: 'Food'),
                      InterestButton(text: 'Politics'),
                    ]
                  ),
                ),
                CustomSpacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterestButton(text: 'Books',),
                      InterestButton(text: 'Movies'),
                      InterestButton(text: 'Writing'),
                      InterestButton(text: 'Dance'),
                    ]
                  ),
                ),
                CustomSpacer(flex: 6),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w
                    ),
                    child: Text(
                      'Lifestyle',
                      style: GoogleFonts.cabin(
                        fontSize: 20.sp,
                        color: Colors.grey,
                      ),
                    )
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Text(
                      'Select tags that describe your lifestyle',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.cabin(
                        color: Colors.grey,
                        fontSize: 15.sp
                      )
                    ),
                  )
                ),
                CustomSpacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InterestButton(text: 'Introvert', ),
                      InterestButton(text: 'Extrovert', width: 80.w),
                      InterestButton(text: 'Neat Freak', width: 95.w),
                    ]
                  ),
                ),
                CustomSpacer(flex: 2,),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InterestButton(text: 'Gym Rat', ),
                      InterestButton(text: 'Nerd'),
                      InterestButton(text: 'Party Animal', width: 95.w),
                    ]
                  ),
                ),
                CustomSpacer(flex: 2),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InterestButton(text: 'Quiet', ),
                      InterestButton(text: 'Non-smoker', width: 95.w),
                      InterestButton(text: 'Smoker'),
                    ]
                  ),
                ),
                CustomSpacer(flex: 2),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InterestButton(text: 'Independent', width: 95.w),
                      InterestButton(text: 'Night Owl', width: 80.w),
                      InterestButton(text: 'Drinker'),
                    ]
                  ),
                ),
                CustomSpacer(flex: 2),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InterestButton(text: 'Love Sharing', width: 95.w),
                      // InterestButton(text: 'Extrovert', width: 80.w),
                      InterestButton(text: 'Playful'),
                    ]
                  ),
                ),
                CustomSpacer(flex: 6)
                
            ])
          ),
        );
      }
    );
  }
}
