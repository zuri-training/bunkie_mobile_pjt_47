import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bunkie/utils/utils.dart';


class CustomDropdown extends StatefulWidget {
  final String hintText;
  final List items;

  const CustomDropdown({
    Key? key,
    required this.hintText,
    required this.items
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}


class _CustomDropdownState extends State<CustomDropdown> {
  var _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: FormField(
        // Dropdown
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: widget.hintText,
              labelStyle: GoogleFonts.cabin(
                fontSize: 14.sp,
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
                    _currentSelectedValue = newValue.toString();
                    state.didChange(newValue);
                  });
                },
                items: widget.items.map((value) {
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
    );
  }
}