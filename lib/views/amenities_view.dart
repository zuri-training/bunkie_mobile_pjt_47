
import 'package:bunkie/services/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/custom_spacer.dart';
import 'package:bunkie/utils/utils.dart';

import 'shared/shared.dart';

class AmenitiesView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (context, size) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomSpacer(flex: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w
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
                            .pushNamed(InterestsAndLifestyleViewRoute);
                        },
                        child: Text(
                          'Next',
                          style: GoogleFonts.cabin(
                            color: Color(0xff027A63),
                            fontSize: 20.sp
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                // CustomSpacer(flex: 10,),
                RichText(
                  text: TextSpan(
                    text: 'Hello ',
                    style: GoogleFonts.cabin(
                      color: Colors.grey,
                      fontSize: 28.sp,
                    ),
                    children: [
                      TextSpan(
                        text: 'James\u{1F600}',
                        style: GoogleFonts.cabin(
                          color: Colors.black,
                        )
                      )
                    ]
                  )
                ),
                CustomSpacer(flex: 5),
                Container(
                  padding: EdgeInsets.only(right: 250.w, bottom: 10),
                  child: Text(
                    'Amenities',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.cabin(
                      color: Color(0xff027A63),
                      fontSize: 20.sp
                    )
                  )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 5.h
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _buildAmenitiesGrid('assets/images/misc/running_water_icon.png', 'Water'),
                          _buildAmenitiesGrid('assets/images/misc/electricity_icon.png', 'Electricity'),
                          _buildAmenitiesGrid('assets/images/misc/wardrobe_icon.png', 'Wardrobe'),
                        ],
                      ),
                      CustomSpacer(flex: 1.3),
                      Row(
                        children: [
                          _buildAmenitiesGrid('assets/images/misc/fan_icon.png', 'Fan'),
                          _buildAmenitiesGrid('assets/images/misc/pot_icon.png', 'Kitchen'),
                          _buildAmenitiesGrid(
                            'assets/images/misc/toilet_bottom_icon.png', 
                            'Toilet'
                          ),
                        ]
                      ),
                      CustomSpacer(flex: 1.3),
                      Row(
                        children: [
                          _buildAmenitiesGrid('assets/images/misc/bathroom_icon.png', 'Bathroom'),
                          _buildAmenitiesGrid('assets/images/misc/ac_icon.png', 'A/C'),
                          _buildAmenitiesGrid('assets/images/misc/parking_icon.png', 'Parking'),
                        ]
                      )
                    ]
                  )
                ),
                
                CustomSpacer(flex: 8),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.w
                    ),
                    child: Text(
                      'Comments',
                      style: GoogleFonts.cabin(
                        fontSize: 15,
                        color: Colors.grey
                      ),
                    ) ,
                  )
                ),
                CustomSpacer(flex: 4),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w
                  ),
                  child: CustomTextField(maxLines: 5),
                ),
                CustomSpacer(flex: 8),         
              ]
            ),
          )
        );
      },
    );
  }

  Widget _buildAmenitiesGrid(String photoUrl, String amenity) {
    bool _tapped = false;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 110.w,
        height: 115.h,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black
          )
        ),
        child: Column(
          children: [
            Image.asset(
              photoUrl
            ),
            Text(
              amenity,
              textAlign: TextAlign.center,
              style: GoogleFonts.cabin(
                fontSize: 15.sp,
              )
            )
          ],
        )
      )
    );
    
  }
}
