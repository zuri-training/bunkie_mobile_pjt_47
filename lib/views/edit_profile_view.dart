import 'dart:io';

import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';


import 'shared/custom_spacer.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  String selectedGender = 'male';

  final _picker = ImagePicker();
  var _image = File('');

  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _universityController = TextEditingController();
  TextEditingController _facultyController = TextEditingController();
  TextEditingController _levelController = TextEditingController();
  TextEditingController _aboutYouController = TextEditingController();
  TextEditingController _religionController = TextEditingController();
  TextEditingController _tribeController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  onSubmit() async {
    if (_auth.currentUser != null) {
      await DatabaseService.updateUserData({
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'faculty': _facultyController.text,
        'level': _levelController.text,
        'bio': _aboutYouController.text,
        'gender': selectedGender,
        'ethnicity': _tribeController.text,
        'religion': _religionController.text,
        'university': _universityController.text,
        'state': _stateController.text,
        'age': _ageController.text,
      }).then((value) {
        if (value == null) {
          print('Value is null');
        } else print("Done");
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      onWillPop: () => locator<NavigationService>().goBack(),
      builder: (context, size) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Profile',
            style: GoogleFonts.cabin(
              color: Colors.white,
              fontSize: 18.sp,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green[800],
          leading: GestureDetector(
            onTap: () => locator<NavigationService>().goBack(),
            child: Container(
              height: 15.h,
              width: 6.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(
                  color: Colors.green.withAlpha(90),
                  blurRadius: 2,
                )],
              ),
              child: Icon(
                Icons.arrow_back,
                size: 25.w
              ),   
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w, top: 20.w),
              child: GestureDetector(
                onTap: () {
                  onSubmit();
                  print('Done');
                  // locator<NavigationService>().pushNamed(SettingsViewRoute);
                },
                child: Text(
                  'Done',
                  style: GoogleFonts.cabin(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Container(
                  child: SafeArea(
                    child: Column(
                      children: [
                        CustomSpacer(flex: 2),
                        Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: _image.path.isNotEmpty ? 
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.file(
                                          _image,
                                          width: 100.w,
                                          height: 100.h,
                                          fit: BoxFit.fitHeight,
                                        )
                                      ) 
                                      : 
                                      Container(
                                        width: 100.w,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(50),
                                        )
                                      )
                                ),
                                Positioned(
                                  height: 100.h,
                                  width: 50.w,
                                  left: 10.w,
                                  child: GestureDetector(
                                    onTap: () => _showPicker(context),
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      size: 25,
                                      color: Colors.black,
                                    )
                                  ),
                                )
                              ],
                            ),
                            
                            CustomSpacer(flex: 1, horizontal: true),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Text(
                                  'Change your profile picture',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cabin(
                                    fontSize: 15.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _firstNameController,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      labelText: 'First Name',
                                      labelStyle: GoogleFonts.cabin(),
                                      hintText: 'First Name',
                                      hintStyle: GoogleFonts.cabin()
                                    ),
                                ),
                              ),
                              CustomSpacer(flex: 4, horizontal: true),
                              Expanded(
                                child: TextFormField(
                                  controller: _lastNameController,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.lightGreen),
                                      ),
                                      labelText: 'Last Name',
                                      labelStyle: GoogleFonts.cabin(),
                                      hintText: 'Last Name',
                                      hintStyle: GoogleFonts.cabin(),
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //CustomSpacer(flex: 3),
                        Container(
                          child: TextFormField(
                            controller: _stateController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_drop_down),
                              ),
                              labelText: 'State',
                              labelStyle: GoogleFonts.cabin()
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _universityController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_drop_down),
                              ),
                              labelText: 'University',
                              labelStyle: GoogleFonts.cabin(),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _facultyController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              labelText: 'Faculty',
                              labelStyle: GoogleFonts.cabin(),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _levelController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              labelText: 'Level',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _religionController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_drop_down),
                              ),
                              labelText: 'Religion',
                              labelStyle: GoogleFonts.cabin(),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _tribeController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_drop_down),
                              ),
                              labelText: 'Tribe',
                              labelStyle: GoogleFonts.cabin(),
                            ),
                          ),
                        ),
                        CustomSpacer(flex: 3),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'How old are you?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                child: TextFormField(
                                  controller: _ageController,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.lightGreen),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.lightGreen),
                                    ),
                                    labelText: 'Age',
                                    labelStyle: GoogleFonts.cabin(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              CustomSpacer(flex: 3, horizontal: true),
                              Expanded(
                                child: Text(
                                  'years old.',
                                  style: GoogleFonts.cabin(
                                    
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomSpacer(flex: 2),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Identify as',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 15.sp,
                              color: Colors.black,
                              // fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: ListTile(
                                  leading: Radio(
                                    value: 'male',
                                    groupValue: selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = 'male';
                                      });
                                    },
                                    activeColor: Colors.green,
                                  ),
                                  title: Text(
                                    'Male',
                                    style: GoogleFonts.cabin(
                                      fontSize: 15.sp
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                leading: Radio(
                                  value: 'female',
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = 'female';
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                                title: Text(
                                  'Female',
                                  style: GoogleFonts.cabin(
                                    fontSize: 15.sp
                                  )
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'About You',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cabin(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        CustomSpacer(flex: 2),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                          ),
                        ),
                        CustomSpacer(flex: 3),
                        CustomButton(
                          text: 'Submit',
                          onPressed: () {
                            locator<NavigationService>()
                                .pushNamed(SettingsViewRoute);
                          },
                        ),
                        CustomSpacer(flex: 4)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Future getImage() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
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
                    getImage();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera_rounded),
                  title: Text('Camera'),
                  onTap: () {
                    getImage();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
