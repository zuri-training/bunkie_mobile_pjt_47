import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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

  var _currentSelectedValue;
  var _currentSelectedUni;

  int _groupValue = -1;

  TextEditingController _controller = TextEditingController();
  String filter = '';

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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16
                )
              ),
              Center(
                child: Text(
                  'Profile',
                  style: GoogleFonts.cabin(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 50,
                  left: 50,
                  top: 15
                ),
                child: Text(
                  "Let's get to know you!",
                  style: GoogleFonts.cabin(
                    color: Colors.green
                  )
                ),
              ),
              SizedBox(height: 10),
              Form(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              labelStyle: GoogleFonts.cabin(
                                fontSize: 14,
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
                                fontSize: 14,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.green)
                              )
                            )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: FormField(
                        // Dropdown
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'State',
                              labelStyle: GoogleFonts.cabin(
                                fontSize: 14,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.green),
                              )
                            ),
                            isEmpty: _currentSelectedValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _currentSelectedValue,
                                isDense: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _currentSelectedValue = newValue;
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
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: FormField(
                        // Dropdown
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                labelText: 'University',
                              labelStyle: GoogleFonts.cabin(
                                fontSize: 14,
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
                        horizontal: 15,
                        vertical: 10
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Faculty',
                          labelStyle: GoogleFonts.cabin(
                            fontSize: 14,
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
                        horizontal: 15,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Level',
                          labelStyle: GoogleFonts.cabin(
                            fontSize: 14,
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
                        horizontal: 15,
                        vertical: 10
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Religion',
                          labelStyle: GoogleFonts.cabin(
                            fontSize: 14,
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
                        horizontal: 15,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Ethnicity',
                          labelStyle: GoogleFonts.cabin(
                            fontSize: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.green),
                          )
                        )
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.only(right: 200),
                child: Text(
                  'Identify as:',
                  style: GoogleFonts.cabin(
                    fontSize: 15
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: _radioButton(
                      title: 'Male',
                      value: 0,
                      onChanged: (newVal) => setState(() => _groupValue = newVal),
                    )
                  ),
                  Expanded(
                    child: _radioButton(
                      title: 'Female',
                      value: 1,
                      onChanged: (newVal) => setState(() => _groupValue = newVal),
                    )
                  ),
                ],
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    )
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.cabin(),
                  )
                ),
              ),
              
              SizedBox(height: 40)
            ]
          )
        ),
      ),
    );
    
  }
  
  Widget _radioButton({String? title, int? value, var onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(
        title.toString(),
        style: GoogleFonts.cabin(
          fontSize: 14
        ),
      )
    );
  }

}