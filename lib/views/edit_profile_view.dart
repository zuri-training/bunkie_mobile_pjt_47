import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:bunkie/views/views.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'shared/custom_spacer.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  String selectedGender = 'male';

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      onWillPop: () => locator<NavigationService>().goBack(),
      builder: (context, size) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Profile',
            style: TextStyle(
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
                  locator<NavigationService>().pushNamed(SettingsViewRoute);
                },
                child: Text(
                  'Done',
                  style: TextStyle(
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
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/landing-page-background.jpg'),
                              radius: 25,
                            ),
                            CustomSpacer(flex: 1, horizontal: true),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Text(
                                  'Change your profile picture',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
                                      hintText: 'First Name'),
                                ),
                              ),
                              CustomSpacer(flex: 4, horizontal: true),
                              Expanded(
                                child: TextFormField(
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
                                      hintText: 'Last Name'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //CustomSpacer(flex: 3),
                        Container(
                          child: TextFormField(
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
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
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
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
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
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
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
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
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
                            ),
                          ),
                        ),
                        CustomSpacer(flex: 3),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'How old are you?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                child: TextFormField(
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
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              CustomSpacer(flex: 3, horizontal: true),
                              Expanded(
                                child: Text(
                                  'years old.',
                                  style: TextStyle(),
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
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
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
                                  title: Text('Male'),
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
                                title: Text('Female'),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'About You',
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
}
