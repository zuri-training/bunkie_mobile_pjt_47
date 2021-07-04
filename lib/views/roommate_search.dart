import 'dart:convert';

import 'package:bunkie/services/services.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:bunkie/utils/utils.dart';

import 'shared/circle_carousel.dart';
import 'shared/custom_carousel.dart';

class RoommateSearchView extends StatefulWidget {
  _RoommateSearchViewState createState() => _RoommateSearchViewState();
}

class _RoommateSearchViewState extends State<RoommateSearchView> {
  bool _rTapped = true;
  List<String> _images = [];

  Future _initImages() async {
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/roommates'))
        .toList();

    setState(() => _images = imagePaths);
  }

  int _currentIndex = 0;
  bool swipedUp = false;

  @override
  void initState() {
    super.initState();
    _initImages();
  }

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
                            Icons.arrow_back_ios_sharp,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    CustomSpacer(flex: 4),
                    Text(
                      '50 students matched your Criteria',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cabin(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                    Expanded(child: CustomCarousel(images: 'images/roommates')),


                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.grey[200],
              selectedItemColor: Colors.grey,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              items: [
                BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap: () {
                        locator<NavigationService>()
                            .pushNamed(SelectionViewRoute);
                      },
                      child: Icon(Icons.house)),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap: () {
                        locator<NavigationService>()
                            .pushNamed(UserProfileViewRoute);
                      },
                      child: Icon(Icons.person)),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: GestureDetector(onTap: () {}, child: Icon(Icons.mail)),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap: () {}, child: Icon(Icons.notifications)),
                  label: 'Notifications',
                ),

              ],
            ),
          );
        });
  }
}
