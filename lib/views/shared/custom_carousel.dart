import 'dart:convert';

import 'package:bunkie/services/navigation_service.dart';
import 'package:bunkie/utils/constants.dart';
import 'package:bunkie/utils/locator.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCarousel extends StatefulWidget {
  /// Custom Carousel widget
  /// Collects image path as argument and returns images contained in that path

  final String images;
  final bool circle;

  const CustomCarousel({Key? key, required this.images, this.circle: false})
      : super(key: key);

  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  List _images = [];
  bool swipedUp = false;

  int currentIndex = 0;
  int circleIndex = 0;

  CarouselController _controller = CarouselController();

  Future _initImages() async {
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains(widget.images))
        .toList();

    setState(() => _images = imagePaths);
  }

  Color getTextColor(Color color) {
    int d = 0;

    // Counting the perceptive luminance
    double luminance =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

    if (luminance > 0.5)
      d = 0; // Bright colours - Black font
    else
      d = 255; // Dark colours - White font

    return Color.fromARGB(color.alpha, d, d, d);
  }

  @override
  void initState() {
    super.initState();
    _initImages();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView(
        shrinkWrap: true,
        children: [
          // Smaller circle avatar carousel
          Container(
            height: 100.h,
            width: 100.w,
            child: CarouselSlider.builder(
              itemCount: _images.length,
              itemBuilder: (ctx, index, realIdx) {
                return GestureDetector(
                    onTap: () {
                      setState(() => circleIndex = index);
                      _controller.animateToPage(circleIndex);
                    },
                    child: Container(
                      margin: EdgeInsets.all(6.0),
                      child: CircleAvatar(
                          minRadius: 50,
                          maxRadius: 70,
                          backgroundImage: AssetImage(_images[index])),
                    ));
              },
              options: CarouselOptions(
                  aspectRatio: 22 / 5,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.2,
                  scrollPhysics: BouncingScrollPhysics()),
            ),
          ),
          // Larger carousel
          Container(
              height: 350.h,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    carouselController: _controller,
                    itemCount: _images.length,
                    itemBuilder: (ctx, index, realIdx) {
                      return GestureDetector(
                          onVerticalDragEnd: (DragEndDetails details) {
                            int sensitivity = 1;
                            if (details.primaryVelocity! > sensitivity) {
                            } else if (details.primaryVelocity! <
                                -sensitivity) {
                              setState(() => swipedUp = true);
                            }
                          },
                          child: Container(
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                      image: AssetImage(_images[index]),
                                      fit: BoxFit.cover)),
                              child: Column(children: [
                                CustomSpacer(flex: 2),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {}, // TODO
                                      child: Icon(Icons.more_vert,
                                          color: Colors.black),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 0),
                                      child: Text(
                                        'Swipe up to view details',
                                        style: GoogleFonts.cabin(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                            backgroundColor: Colors.white,
                                            color: Colors.black),
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {}, // TODO
                                        child: Icon(Icons.star_outline,
                                            color: Colors.lightGreen))
                                  ],
                                ),
                              ])));
                    },
                    options: CarouselOptions(
                        onPageChanged: (int index, reason) {
                          setState(() => currentIndex = index);
                        },
                        // aspectRatio: 16 / 9,
                        height: 300.h,
                        enlargeCenterPage: true,
                        // autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.7,
                        scrollPhysics: BouncingScrollPhysics()),
                  ),

                  /// This prevents the circle avatar carousel from
                  /// opening up dismissible user card.
                  swipedUp
                      ? Positioned(
                          height: 350.h,
                          width: 250.w,
                          bottom: 15.h,
                          left: 55.w,
                          child: Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.vertical,
                              onDismissed: (direction) => setState(() {
                                    swipedUp = false;
                                  }),
                              child: Card(
                                  color: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 1,
                                  child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Row(children: [
                                            Flexible(
                                                fit: FlexFit.loose,
                                                child: Text(
                                                  _images[currentIndex],
                                                  style: GoogleFonts.cabin(
                                                      fontSize: 18.sp,
                                                      color: Colors.white),
                                                )),
                                            Icon(
                                                Icons
                                                    .check_circle_outline_sharp,
                                                color: Colors.lightGreen)
                                          ]),
                                          CustomSpacer(flex: 3),
                                          Row(children: [
                                            Container(
                                              height: 8.h,
                                              width: 8.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                            ),
                                            CustomSpacer(
                                                flex: 2, horizontal: true),
                                            Flexible(
                                                child: Text(
                                              'University of Port Harcourt',
                                              overflow: TextOverflow.clip,
                                              textAlign: TextAlign.left,
                                              softWrap: true,
                                              style: GoogleFonts.cabin(
                                                  fontSize: 15.sp,
                                                  color: Colors.white),
                                            )),
                                          ]),
                                          CustomSpacer(flex: 2),
                                          Row(children: [
                                            Container(
                                              height: 8.h,
                                              width: 8.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                            ),
                                            CustomSpacer(
                                                flex: 2, horizontal: true),
                                            Text(
                                              '200L',
                                              overflow: TextOverflow.clip,
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                              style: GoogleFonts.cabin(
                                                  fontSize: 15.sp,
                                                  color: Colors.white),
                                            )
                                          ]),
                                          CustomSpacer(flex: 2),
                                          Row(children: [
                                            Container(
                                              height: 8.h,
                                              width: 8.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                            ),
                                            CustomSpacer(
                                                flex: 2, horizontal: true),
                                            Text(
                                              'Move in',
                                              overflow: TextOverflow.clip,
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                              style: GoogleFonts.cabin(
                                                  fontSize: 15.sp,
                                                  color: Colors.white),
                                            )
                                          ]),
                                          CustomSpacer(flex: 4),
                                          GestureDetector(
                                              onTap: () {
                                                locator<NavigationService>()
                                                    .pushNamed(RoommateProfileViewRoute);
                                              },
                                              child: Text('TAP TO VIEW PROFILE',
                                                  style: GoogleFonts.cabin(
                                                    fontSize: 15.sp,
                                                    color:
                                                        Colors.lightGreenAccent,
                                                  ))),
                                          CustomSpacer(flex: 7),
                                          Container(
                                              height: 50.h,
                                              width: 100.w,
                                              child: TextButton(
                                                  onPressed: () {},
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .lightGreen),
                                                      shape: MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)))),
                                                  child: Text(
                                                    'Chat',
                                                    style: GoogleFonts.cabin(
                                                        color: Colors.white),
                                                  )))
                                        ],
                                      )))))
                      : Container(),
                ],
              )),
        ],
      )
    ]);
  }
}
