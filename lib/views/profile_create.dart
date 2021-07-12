import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/constants.dart';
import 'package:bunkie/utils/locator.dart';
import 'package:bunkie/views/shared/custom_searchable_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/responsive_widget.dart';
import 'package:bunkie/utils/utils.dart';

class ProfileCreate extends StatefulWidget {
  _ProfileCreateState createState() => _ProfileCreateState();
}

class _ProfileCreateState extends State<ProfileCreate> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  var _selectedState;
  var _selectedUni;
  var _selectedLevel;
  var _selectedFaculty;

  int _groupValue = 0;

  TextEditingController _controller = TextEditingController();
  TextEditingController _facultyController = TextEditingController();
  String filter = '';

  List<String> level = ['Pre-Degree', '100', '200', '300', '400', '500', '600'];

  onSubmit() async {

    if (_auth.currentUser != null) {
      await DatabaseService.updateUserData({
        'faculty': _facultyController.text.isEmpty ?
          _selectedFaculty : _facultyController.text,
        'level': _selectedLevel,
        'university': _selectedUni,
        'state': _selectedState,
        'gender': _groupValue == 0 ? 'male' : 'female',
        // 'avatar': 'gs://bunkie-54bf1.appspot.com/ggg$_image'
      });
    }
    
  }
  
  @override
  void initState() {
    super.initState();
    // Fill list with objects
    _controller.addListener(() {
      setState(() => filter = _controller.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _facultyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 30.h)),
          Center(
            child: Text(
              'Profile',
              style: GoogleFonts.cabin(
                fontSize: 20.sp,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 50.w, left: 50.w, top: 15.h),
            child: Text("Let's get to know you!",
                style: GoogleFonts.cabin(color: Colors.green)),
          ),
          SizedBox(height: 20.h),
          Form(
              child: Column(
            children: [
              SizedBox(height: 10.h),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: CustomSearchableDropdown(
                      hintText: 'Select state',
                      items: StatesInNigeria,
                      onChanged: (newValue) =>
                          setState(() => _selectedState = newValue))),
              SizedBox(height: 10.h),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: CustomSearchableDropdown(
                      hintText: 'Select university',
                      items: Universities,
                      onChanged: (newValue) =>
                          setState(() => _selectedUni = newValue))),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: FormField(
                    // Dropdown
                    builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        hintText: 'Select Faculty/School',
                        hintStyle: GoogleFonts.cabin(fontSize: 14.sp),
                        labelText: 'Faculty/School',
                        labelStyle: GoogleFonts.cabin(
                          fontSize: 14.sp,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.green),
                        )),
                    isEmpty: _selectedFaculty == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: _selectedFaculty,
                          isDense: true,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedFaculty = newValue.toString();
                              state.didChange(newValue);
                            });
                          },
                          items: Faculties.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.cabin(),
                              ),
                            );
                          }).toList()),
                    ),
                  );
                }),
              ),
              _selectedFaculty == 'Others' ?
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: TextFormField(
                      controller: _facultyController,
                      decoration: InputDecoration(
                          labelText: 'Please specify faculty',
                          labelStyle: GoogleFonts.cabin(
                            fontSize: 14.sp,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.green),
                          ))),
                ) : Container(),
              SizedBox(height: _selectedFaculty == 'Others' ? 10.h : 0.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: FormField(
                    // Dropdown
                    builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        hintText: 'Select Level',
                        hintStyle: GoogleFonts.cabin(fontSize: 14.sp),
                        labelText: 'Level',
                        labelStyle: GoogleFonts.cabin(
                          fontSize: 14.sp,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.green),
                        )),
                    isEmpty: _selectedLevel == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: _selectedLevel,
                          isDense: true,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLevel = newValue.toString();
                              state.didChange(newValue);
                            });
                          },
                          items: level.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.cabin(),
                              ),
                            );
                          }).toList()),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20.h),
            ],
          )),
          Padding(
            padding: EdgeInsets.only(right: 200.w),
            child: Text(
              'Identify as:',
              style: GoogleFonts.cabin(fontSize: 15.sp),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: _buildRadioButton(
                title: 'Male',
                value: 0,
                onChanged: (newVal) => setState(() => _groupValue = newVal),
              )),
              Expanded(
                  child: _buildRadioButton(
                title: 'Female',
                value: 1,
                onChanged: (newVal) => setState(() => _groupValue = newVal),
              )),
            ],
          ),
          Container(
            width: 200.w,
            child: ElevatedButton(
                onPressed: () {
                  onSubmit();
                  locator<NavigationService>().pushNamed(SelectionViewRoute);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xff027A63),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.cabin(),
                )),
          ),
          SizedBox(height: 40.h)
        ])),
      );
    });
  }

  Widget _buildRadioButton({String? title, int? value, var onChanged}) {
    return RadioListTile(
        value: value,
        activeColor: Color(0xff027A63),
        groupValue: _groupValue,
        onChanged: onChanged,
        title: Text(
          title.toString(),
          style: GoogleFonts.cabin(fontSize: 14.sp),
        ));
  }
}
