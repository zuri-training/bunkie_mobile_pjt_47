import 'dart:convert';

import 'package:bunkie/services/services.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:bunkie/utils/utils.dart';

import 'shared/circle_carousel.dart';
import 'shared/custom_carousel.dart';
import 'shared/navigation_bar.dart';

class ApartmentSearchView extends StatefulWidget {
  _ApartmentSearchViewState createState() => _ApartmentSearchViewState();
}

class _ApartmentSearchViewState extends State<ApartmentSearchView> {
  bool _rTapped = true;
  List<String> _images = [];

  Future _initImages() async {
    final manifestContent =
    await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/apartments'))
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
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 25.h,
                          ),
                        ),
                      ),
                    ),
                    CustomSpacer(flex: 4),
                    Text(
                      '50 rooms matched your criteria -',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cabin(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                    CustomCarousel(images: 'images/apartments'),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavBar(),
          );
        });
  }
}
