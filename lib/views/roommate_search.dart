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
    final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
      .where((String key) => key.contains('images/roommates')).toList();
    
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
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [            
                // CustomSpacer(flex: 10),
                SizedBox(height: 50.h),
                Row(            
                  children: [
                    CustomSpacer(flex: 4, horizontal: true),
                    Text(
                      '50 students matched your criteria -',
                      style: GoogleFonts.cabin(
                        color: Colors.grey,
                        fontSize: 18.sp,
                      ),
                    )
                  ] 
                ),
                CircleAvatarCarousel(images: 'images/roommates'),
                CustomCarousel(images: 'images/roommates')            
              ],
            )
          )
        );
      }
    );
    
  }
}