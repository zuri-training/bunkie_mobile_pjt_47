import 'package:bunkie/services/auth_service.dart';
import 'package:bunkie/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/responsive_widget.dart';
import 'package:bunkie/utils/utils.dart';


class SelectionView extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      onWillPop: () {
        locator<NavigationService>()
          .pushNamed(LandingViewRoute);
      },
      builder: (context, size) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Welcome to ',
                          style: GoogleFonts.cabin(
                            fontSize: 24.sp,
                            color: Colors.black
                          ),
                          children: [
                            TextSpan(
                              text: 'Bunkie',
                              style: GoogleFonts.cabin(
                                fontSize: 24.sp,
                                color: Colors.green,
                                fontWeight: FontWeight.bold
                              )
                            )
                          ]
                        ),
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    softWrap: true,
                    text: TextSpan(
                      text: "Having a roommate that's a companion",
                      style: GoogleFonts.cabin(
                        color: Colors.green
                      ),
                      children: [
                        TextSpan(
                          text: "\nis a blessing. Let's help you find one\ntoday!",
                        )
                      ]
                    )
                  )
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () => locator<NavigationService>()
                                .pushNamed(LookingForRoommateViewRoute),
                  child: Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(
                        color: Colors.green.withAlpha(90),
                        blurRadius: 6,
                        spreadRadius: 5,
                        offset: Offset(0.0, 3.0)
                      )],
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.green, Colors.white]
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/misc/experts.png'
                        )
                      )
                    ),
                  )
                ),
                SizedBox(height: 30.h,),
                Text(
                  'I Need a Roommate',
                  style: GoogleFonts.cabin(
                    fontSize: 20.sp
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                  horizontal: 15.w),
                  child: Text(
                    'Tap Icon if you have a room and you need a roommate',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: GoogleFonts.cabin(
                      color: Colors.green,
                      fontSize: 15.sp
                    ),
                  )
                ),
                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: () {
                    locator<NavigationService>()
                      .pushNamed(LookingForApartmentViewRoute);
                  },
                  child: Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      boxShadow: [BoxShadow(
                        color: Colors.green.withAlpha(50),
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: Offset(0.0, 3.0)
                      )],
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.green, Colors.white]
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/misc/quiet_town.jpg',
                        ),
                        colorFilter: ColorFilter.mode(Colors.green, BlendMode.dstIn)
                      )
                    ),
                  )
                ),
                SizedBox(height: 30.h,),
                Text(
                  'I Need a Room',
                  style: GoogleFonts.cabin(
                    fontSize: 20.sp
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                  horizontal: 15.w),
                  child: Text(
                    'Tap Icon if you need a roommate that has a\nroom',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: GoogleFonts.cabin(
                      color: Colors.green,
                      fontSize: 15.sp
                    ),
                  )
                ),

                SizedBox(height: 10.h,)              
                
              ],
            ),
          )
            
        );
      }
    );
    
  }
}