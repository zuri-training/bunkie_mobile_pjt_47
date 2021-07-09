import 'package:bunkie/models/user.dart';
import 'package:bunkie/services/auth_service.dart';
import 'package:bunkie/services/firestore_service.dart';
import 'package:bunkie/services/navigation_service.dart';
import 'package:bunkie/utils/constants.dart';
import 'package:bunkie/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/responsive_widget.dart';
import 'package:bunkie/utils/utils.dart';


class ProfileCreate extends StatefulWidget {
  _ProfileCreateState createState() => _ProfileCreateState();
}


class _ProfileCreateState extends State<ProfileCreate> {
  /// Temporary list to test out dropdown functionality.
  /// To be replaced by backend data.
  List _states = [
    'Cross River',
    'Akwa Ibom',
    'Kaduna',
    'Kano',
    'Zamfara',
    'Kogi',
    'Kwara'
  ];
  
  ///
  List _unis = [
    'University of Port-Harcourt',
    'University of Calabar',
    'University of Abuja',
    'University of Lagos',
    'University of Uyo',
  ];
  
   AuthService _auth = AuthService();
   FireStoreService _firestore = FireStoreService();
   
  var _currentSelectedState;
  var _currentSelectedUni;

  int _groupValue = -1;

  TextEditingController _controller = TextEditingController();
  TextEditingController _facultyController = TextEditingController();
  TextEditingController _levelController = TextEditingController();
  TextEditingController _religionController = TextEditingController();
  TextEditingController _ethnicityController = TextEditingController();
  String filter = '';


  createProfile() async {
    if (_auth.currentUser() != null) {
      await _firestore.createUser(CustomUser(
        faculty: _facultyController.text,
        level: _levelController.text,
        religion: _religionController.text,
        ethnicity: _ethnicityController.text,
        gender: _groupValue == 0 ? 'Male' : 'Female',
        university: _currentSelectedUni,
        state: _currentSelectedState
      ));
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
  }
  
  @override 
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (context, size) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30.h
                  )
                ),
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
                  padding: EdgeInsets.only(
                    right: 50.w,
                    left: 50.w,
                    top: 15.h
                  ),
                  child: Text(
                    "Let's get to know you!",
                    style: GoogleFonts.cabin(
                      color: Colors.green
                    )
                  ),
                ),
                SizedBox(height: 20.h),
                Form(
                  child: Column(
                    children: [
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                labelStyle: GoogleFonts.cabin(
                                  fontSize: 14.sp,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.green)
                                )
                              ),
                            )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                labelStyle: GoogleFonts.cabin(
                                  fontSize: 14.sp,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.green)
                                )
                              )
                            ),
                          )
                        ],
                      ),*/
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                        ),
                        child: FormField(
                          // Dropdown
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'State',
                                labelStyle: GoogleFonts.cabin(
                                  fontSize: 14.sp,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.green),
                                )
                              ),
                              isEmpty: _currentSelectedState == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _currentSelectedState,
                                  isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _currentSelectedState = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _states.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.cabin(),
                                      ),
                                    );
                                  }).toList()
                                ),
                              ),
                              
                            );
                          }                 
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                        ),
                        child: FormField(
                          // Dropdown
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  labelText: 'University',
                                labelStyle: GoogleFonts.cabin(
                                  fontSize: 14.sp,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.green),
                                )
                              ),
                              isEmpty: _currentSelectedUni == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _currentSelectedUni,
                                  isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _currentSelectedUni = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _unis.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.cabin(),
                                      ),
                                    );
                                  }).toList()
                                ),
                              ),
                              
                            );
                          }
                          
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 10.h
                        ),
                        child: TextFormField(
                          controller: _facultyController,
                          decoration: InputDecoration(
                            labelText: 'Faculty',
                            labelStyle: GoogleFonts.cabin(
                              fontSize: 14.sp,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.green),
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Level',
                            labelStyle: GoogleFonts.cabin(
                              fontSize: 14.sp,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.green),
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 10.h
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Religion',
                            labelStyle: GoogleFonts.cabin(
                              fontSize: 14.sp,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.green),
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Ethnicity',
                            labelStyle: GoogleFonts.cabin(
                              fontSize: 14.sp,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.green),
                            )
                          )
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(right: 200.w),
                  child: Text(
                    'Identify as:',
                    style: GoogleFonts.cabin(
                      fontSize: 15.sp
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildRadioButton(
                        title: 'Male',
                        value: 0,
                        onChanged: (newVal) => setState(() => _groupValue = newVal),
                      )
                    ),
                    Expanded(
                      child: _buildRadioButton(
                        title: 'Female',
                        value: 1,
                        onChanged: (newVal) => setState(() => _groupValue = newVal),
                      )
                    ),
                  ],
                ),
                Container(
                  width: 200.w,
                  child: ElevatedButton(
                    onPressed: () {
                      createProfile();
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
                    )
                  ),
                ),
              
                SizedBox(height: 40.h)
              ]
            )
          ),
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
          style: GoogleFonts.cabin(
            fontSize: 14.sp
          ),
        )
      );
    }
  }