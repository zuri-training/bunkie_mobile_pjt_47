import 'dart:convert';
import 'dart:developer';

import 'package:bunkie/services/auth_service.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../chat_detail.dart';
import '../roommate_profile_view.dart';

class CustomCarousel extends StatefulWidget {
  /// Custom Carousel widget
  /// Collects image path as argument and returns images contained in that path

  final String images;
  final bool circle;
  final Query collection;

  const CustomCarousel({Key? key, 
    required this.images, 
    this.circle: false,
    required this.collection
  }) : super(key: key);

  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  List _images = [];
  bool swipedUp = false;

  int currentIndex = 0;
  int circleIndex = 0;

  var _currentUserSelected;
  var allUsers;
  String? imageUrl;
  String? circleImageUrl;
  String placeholder = "https://firebasestorage.googleapis.com/v0/b/bunkie-54bf1.appspot.com/o/avatars%2F4tmU15HOf0a1Rebs1wT6wZU2XoY2%2Fscaled_image_picker1103595624.png?alt=media&token=b9dbada7-fbbc-4769-99ca-2bba17aa398d";

  AuthService _auth = AuthService();

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
      StreamBuilder<QuerySnapshot>(
        stream: widget.collection.snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            log('ERROR: ${snapshot.error}');
            return Center(
                child: Text(
              'Something went wrong!',
              style: GoogleFonts.cabin(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.sp),
            ));
          }
          if (snapshot.hasData || snapshot.data != null) {
              allUsers = snapshot.data!.docs;
              // allUsers.forEach((user) => print("USER: ${user['firstName']}, ${user['lastName']} "));
              return ListView(
                shrinkWrap: true,
                children: [
                  // Smaller circle avatar carousel
                  Container(
                    height: 100.h,
                    width: 100.w,
                    child: CarouselSlider.builder(
                      itemCount: allUsers.length,
                      itemBuilder: (ctx, index, realIdx) {

                        circleImageUrl = 
                            allUsers[realIdx]['avatar'] == null || 
                            allUsers[realIdx]['avatar'] == "" 
                          ? placeholder
                          : allUsers[realIdx]['avatar'];

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
                                  foregroundImage: CachedNetworkImageProvider(
                                    circleImageUrl!),
                                )
                            ));
                      },
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        pageSnapping: false,
                        aspectRatio: 22 / 5,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.2,
                      ),
                    ),
                  ),
                  // Larger carousel
                  Container(
                      height: 350.h,
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                            carouselController: _controller,
                            itemCount: allUsers.length,
                            itemBuilder: (ctx, index, realIdx) {
                              _currentUserSelected = allUsers[currentIndex];

                              imageUrl = 
                                allUsers[realIdx]['avatar'] == null || 
                                allUsers[realIdx]['avatar'] == "" 
                              ? placeholder
                              : allUsers[realIdx]['avatar'];
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
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(imageUrl!),
                                              fit: BoxFit.cover)),
                                      child: Column(children: [
                                        CustomSpacer(flex: 2),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                  setState(() => _currentUserSelected = allUsers[currentIndex]);
                                },
                                // reverse: true,
                                aspectRatio: 16 / 9,
                                height: 300.h,
                                enlargeCenterPage: true,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: false,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          elevation: 1,
                                          child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        fit: FlexFit.loose,
                                                        child: Text(
                                                          "${capitalize(allUsers[currentIndex]['firstName'])} ${capitalize(allUsers[currentIndex]['lastName'])}",
                                                          style:
                                                              GoogleFonts.cabin(
                                                                  fontSize: 18.sp,
                                                                  color: Colors
                                                                      .white),
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
                                                        flex: 2,
                                                        horizontal: true),
                                                    Flexible(
                                                        child: Text(
                                                      allUsers[currentIndex]['university'] == '' ?
                                                        'University of Lagos' : allUsers[currentIndex]['university'],
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
                                                        flex: 2,
                                                        horizontal: true),
                                                    Text(
                                                      allUsers[currentIndex]['level'] == '' ?
                                                         '200L' : '${allUsers[currentIndex]['level']}L',
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
                                                        flex: 2,
                                                        horizontal: true),
                                                    Text(
                                                      capitalize(allUsers[currentIndex]['gender']),
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
                                                      onTap: () => Navigator.push(context, MaterialPageRoute(
                                                        builder: (context) {
                                                          return RoommateProfileView(user: allUsers[currentIndex]);
                                                        }
                                                      )),
                                                      child: Text(
                                                          'TAP TO VIEW PROFILE',
                                                          style:
                                                              GoogleFonts.cabin(
                                                            fontSize: 15.sp,
                                                            color: Colors
                                                                .lightGreenAccent,
                                                          ))),
                                                  CustomSpacer(flex: 7),
                                                  Container(
                                                      height: 50.h,
                                                      width: 100.w,
                                                      child: TextButton(
                                                          onPressed: () => createConversation(context),
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .lightGreen),
                                                              shape: MaterialStateProperty.all(
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)))),
                                                          child: Text(
                                                            'Chat',
                                                            style:
                                                                GoogleFonts.cabin(
                                                                    color: Colors
                                                                        .white),
                                                          )))
                                                ],
                                              )))))
                              : Container(),
                        ],
                      )),
                ],
              );
            }
          return Center(
            child: CircularProgressIndicator.adaptive()
          );
        },
      )
    ]);
  }

  void createConversation(BuildContext context) {
    String convoID = Helpers.getConvoID(_auth.currentUser()!.uid, _currentUserSelected['id']);
    
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ChatDetailView(
              uid: _auth.currentUser()!.uid,
              contact: _currentUserSelected,
              convoID: convoID,
              photoURL: _currentUserSelected['avatar'] ?? 'https://i.pravatar.cc/150?img=1',
            )));
  }
}
