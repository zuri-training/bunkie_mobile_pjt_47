

import 'package:bunkie/services/services.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:bunkie/utils/utils.dart';

import 'shared/custom_carousel.dart';
import 'shared/navigation_bar.dart';

class RoommateSearchView extends StatefulWidget {
  final Query collection;
  
  const RoommateSearchView({
    Key? key,
    required this.collection,
  }) : super(key: key);

  _RoommateSearchViewState createState() => _RoommateSearchViewState();
}

class _RoommateSearchViewState extends State<RoommateSearchView> {
      
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        onWillPop: () => locator<NavigationService>().goBack(),
        builder: (context, size) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/HsTope.png'),
                  fit: BoxFit.none,
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    CustomSpacer(flex: 3),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            locator<NavigationService>().goBack();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 25.h,
                          ),
                        ),
                      ),
                    ),
                    CustomSpacer(flex: 4),
                    /*Text(
                      '50 students matched your criteria -',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cabin(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),*/
                    CustomCarousel(images: 'images/roommates', collection: widget.collection),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavBar(),
          );
        });
  }
}
