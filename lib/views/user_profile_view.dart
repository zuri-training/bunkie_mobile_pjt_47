import 'dart:developer';
import 'dart:io';

import 'package:bunkie/services/auth_service.dart';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/services/storage_service.dart';
import 'package:bunkie/views/shared/custom_spacer.dart';
import 'package:bunkie/views/shared/full_name_stream.dart';
import 'package:bunkie/views/shared/navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import 'shared/responsive_widget.dart';
import 'package:bunkie/utils/utils.dart';

class UserProfileView extends StatefulWidget {
  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  AuthService _authService = AuthService();
  User? loggedInUser;
  String? lastname;

  var user;

  @override
  void initState() {
    loggedInUser = _authService.currentUser();
    log(loggedInUser!.uid);
    super.initState();
  }

  bool allow = true;
  bool sound = true;
  bool roommate = true;
  bool messages = true;

  var _image = File('');
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(onWillPop: () {
      locator<NavigationService>().goBack();
    }, builder: (context, size) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/HsTope.png'),
              fit: BoxFit.none,
            ),
          ),
          child: SafeArea(
            child: StreamBuilder(
              stream: locator<FirestoreService>().getUser(loggedInUser!.uid),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  user = snapshot.data;
                }
                if (!snapshot.hasData) return Container();
                return Column(
                  children: [
                    CustomSpacer(flex: 2),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                locator<NavigationService>().goBack();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30.h,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              locator<NavigationService>().pushNamed(MenuViewRoute);
                            },
                            child:
                                Icon(Icons.menu, color: Colors.white, size: 30.h),
                          ),
                        ],
                      ),
                    ),
                    CustomSpacer(flex: 2),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            foregroundImage: CachedNetworkImageProvider(
                                user['avatar']),
                            backgroundImage: AssetImage('assets/images/roommates/roommate1.jpeg'),
                            radius: 25,
                          ),
                          CustomSpacer(flex: 2),
                          Container(
                            alignment: Alignment.topLeft,

                            child: FullNameStream(
                              loggedInUser: loggedInUser!,
                              style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                            ),

                          ),
                          CustomSpacer(flex: 2),
                          Container(
                            child: Text(
                              'About:',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cabin(
                                fontSize: 13.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          CustomSpacer(flex: 1),
                          Container(
                            child: Text(
                              user['bio'] ?? 'I am not complicated. As a matter of fact, i believe in the simplicity of all things and this enables me take life one step at a time while doing my best to keep everything simple',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.cabin(
                                fontSize: 13.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          CustomSpacer(flex: 15),
                          Container(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () => _showPicker(context),
                                child: Icon(Icons.add_circle_outline,
                                    color: Colors.black, size: 30),
                              )),
                          CustomSpacer(flex: 5),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 120.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/landing-page-background.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                CustomSpacer(flex: 4, horizontal: true),
                                Container(
                                  height: 120.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/landing-page-background.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomSpacer(flex: 6),
                        ],
                      ),
                    ),
                  ],
                );
              }
            )    
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      );
    });
  }

  Future getImage(String inputSource) async {
    final PickedFile? pickedImage;

    try {
      pickedImage = await _picker.getImage(
        source: inputSource == 'camera'.toLowerCase()
            ? ImageSource.camera
            : ImageSource.gallery,
        maxWidth: 1920,
        imageQuality: 70,
      );

      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage!.path);
          print('PICKED ${pickedImage.path}');
        });

        final String fileName = path.basename(pickedImage.path);

        try {
          // Uploading the selected image
          await StorageService.storage.ref(fileName).putFile(
              _image,
              SettableMetadata(
                  customMetadata: {'uploadedBy': loggedInUser!.uid}));
          setState(() {});
        } on FirebaseException catch (e) {
          print(e);
        }
      } else
        print('No image selected');
    } catch (err) {
      print(err);
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext _build) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: [
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Library'),
                    onTap: () {
                      getImage('gallery');
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_camera_rounded),
                    title: Text('Camera'),
                    onTap: () {
                      getImage('camera');
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
