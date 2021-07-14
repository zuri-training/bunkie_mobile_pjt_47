import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart' as path;

import 'package:bunkie/utils/utils.dart';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/services/storage_service.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'shared/custom_searchable_dropdown.dart';
import 'shared/custom_spacer.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  String selectedGender = 'male';
  String? _stateSelected;
  String? _universitySelected;
  var _levelSelected;
  var userProfile;

  final _picker = ImagePicker();
  var _image = File('');
  String? filename;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirestoreService _firestoreService = FirestoreService();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _facultyController = TextEditingController();
  TextEditingController _aboutYouController = TextEditingController();
  TextEditingController _religionController = TextEditingController();
  TextEditingController _tribeController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  onSubmit() async {
    validateForm();

    if (_auth.currentUser != null) {
      await DatabaseService.updateUserData({
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'faculty': _facultyController.text,
        'level': _levelSelected ?? userProfile['level'],
        'bio': _aboutYouController.text,
        'gender': selectedGender,
        'ethnicity': _tribeController.text,
        'religion': _religionController.text,
        'university': Universities.contains(_universitySelected)
            ? _universitySelected
            : userProfile['university'],
        'state': _stateSelected ?? userProfile['state'],
        'age': _ageController.text,
        // 'avatar': 'gs://bunkie-54bf1.appspot.com/ggg$_image'
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withAlpha(90),
                          blurRadius: 2,
                        )
                      ],
                    ),
                    child: Icon(Icons.arrow_back, size: 25.w),
                  ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w, top: 20.w),
                    child: GestureDetector(
                      onTap: () {
                        onSubmit();
                        locator<NavigationService>()
                            .popAndPushNamed(SettingsViewRoute);
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
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: FutureBuilder(
                        future:
                            _firestoreService.getUser(_auth.currentUser!.uid),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            userProfile = snapshot.data;
                          }
                          if (!snapshot.hasData) return Container();
                          return Padding(
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
                                                    child: _image
                                                            .path.isNotEmpty
                                                        ? ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            child: Image.file(
                                                              _image,
                                                              width: 100.w,
                                                              height: 100.h,
                                                              fit: BoxFit
                                                                  .fitHeight,
                                                            ))
                                                        : Container(
                                                            width: 100.w,
                                                            height: 100.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xffFDCF09),
                                                              ),
                                                              color: Colors
                                                                  .grey[200],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                            ))),
                                                Positioned(
                                                  height: 100.h,
                                                  width: 50.w,
                                                  left: 10.w,
                                                  child: GestureDetector(
                                                      onTap: () =>
                                                          _showPicker(context),
                                                      child: Icon(
                                                        Icons
                                                            .camera_alt_rounded,
                                                        size: 25,
                                                        color: Colors.black,
                                                      )),
                                                )
                                              ],
                                            ),
                                            CustomSpacer(
                                                flex: 1, horizontal: true),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: Text(
                                                  'Change your profile picture',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.cabin(
                                                    fontSize: 15.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                                  onChanged: (text) => {},
                                                  controller:
                                                      _firstNameController
                                                        ..text = capitalize(
                                                            userProfile[
                                                                'firstName']),
                                                  validator: (val) {
                                                    return val!.isEmpty
                                                        ? 'Enter a valid text'
                                                        : null;
                                                  },
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .lightGreen),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .lightGreen),
                                                    ),
                                                    labelText: 'First Name',
                                                    labelStyle:
                                                        GoogleFonts.cabin(),
                                                  ),
                                                ),
                                              ),
                                              CustomSpacer(
                                                  flex: 4, horizontal: true),
                                              Expanded(
                                                child: TextFormField(
                                                  onChanged: (text) => {},
                                                  validator: (val) =>
                                                      val!.isEmpty
                                                          ? 'Enter a valid text'
                                                          : null,
                                                  controller:
                                                      _lastNameController
                                                        ..text = capitalize(
                                                            userProfile[
                                                                'lastName']),
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .lightGreen),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .lightGreen),
                                                    ),
                                                    labelText: 'Last Name',
                                                    labelStyle:
                                                        GoogleFonts.cabin(),
                                                    hintText: 'Last Name',
                                                    hintStyle:
                                                        GoogleFonts.cabin(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CustomSpacer(flex: 3),
                                        CustomSearchableDropdown(
                                          hintText: 'State',
                                          items: StatesInNigeria,
                                          onChanged: (newValue) => setState(
                                              () => _stateSelected = newValue),
                                          initialValue: userProfile['state'],
                                        ),
                                        CustomSpacer(flex: 3),
                                        CustomSearchableDropdown(
                                          hintText: 'University',
                                          items: Universities,
                                          onChanged: (newValue) => setState(
                                              () => _universitySelected =
                                                  newValue),
                                          initialValue:
                                              userProfile['university'],
                                        ),
                                        CustomSpacer(flex: 3),
                                        CustomSearchableDropdown(
                                          hintText: 'Level',
                                          items: [
                                            '100',
                                            '200',
                                            '300',
                                            '400',
                                            '500',
                                            '600'
                                          ],
                                          onChanged: (newValue) => setState(
                                              () => _levelSelected = newValue),
                                          showSearchBox: false,
                                          initialValue: userProfile['level'],
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
                                                  validator: (val) =>
                                                      val!.isEmpty
                                                          ? 'Enter a valid text'
                                                          : null,
                                                  controller: _ageController
                                                    ..text =
                                                        userProfile['age'] ??
                                                            "",
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .lightGreen),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .lightGreen),
                                                    ),
                                                    labelText: 'Age',
                                                    labelStyle:
                                                        GoogleFonts.cabin(),
                                                  ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                ),
                                              ),
                                              CustomSpacer(
                                                  flex: 3, horizontal: true),
                                              Expanded(
                                                child: Text('years old.',
                                                    style: GoogleFonts.cabin()),
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
                                                        selectedGender =
                                                            userProfile[
                                                                'gender'];
                                                      });
                                                    },
                                                    activeColor: Colors.green,
                                                  ),
                                                  title: Text(
                                                    'Male',
                                                    style: GoogleFonts.cabin(
                                                        fontSize: 15.sp),
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
                                                title: Text('Female',
                                                    style: GoogleFonts.cabin(
                                                        fontSize: 15.sp)),
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
                                            controller: _aboutYouController
                                              ..text = userProfile['bio'] ?? "",
                                            validator: (val) => val!.isEmpty
                                                ? 'Enter a valid text'
                                                : null,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.lightGreen),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.lightGreen),
                                              ),
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: 5,
                                          ),
                                        ),
                                        CustomSpacer(flex: 3),
                                        CustomButton(
                                          text: 'Submit',
                                          onPressed: () {
                                            onSubmit();
                                            locator<NavigationService>()
                                                .popAndPushNamed(
                                                    SelectionViewRoute);
                                          },
                                        ),
                                        CustomSpacer(flex: 4)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
              ));
        });
  }

  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _aboutYouController.dispose();
    _facultyController.dispose();
  }

  void validateForm() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else
      print('Form is invalid');
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

        setState(() => filename = path.basename(pickedImage!.path));

        try {
          // Uploading the selected image
          await StorageService.storage.ref(filename).putFile(
              _image,
              SettableMetadata(
                  customMetadata: {'uploadedBy': _auth.currentUser!.uid}));
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
