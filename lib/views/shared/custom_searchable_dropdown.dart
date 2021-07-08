import 'package:flutter/material.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bunkie/utils/utils.dart';


// ignore: must_be_immutable
class CustomSearchableDropdown extends StatefulWidget {
  final String hintText;
  final List<String> items;
  var onChanged;
  bool showSearchBox;
  var initialValue;

  CustomSearchableDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    this.onChanged,
    this.showSearchBox: true,
    this.initialValue
  }) : super(key: key);

  @override
  _CustomSearchableDropdownState createState() => _CustomSearchableDropdownState();
}

class _CustomSearchableDropdownState extends State<CustomSearchableDropdown> {

  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
      autoFocusSearchBox: true,
      dropdownSearchDecoration: InputDecoration(
        labelText: 'Search...',
        labelStyle: GoogleFonts.cabin(
          fontSize: 20.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.lightGreen),
        )
      ),
      searchBoxDecoration: InputDecoration(
        labelText: 'Search...',
        labelStyle: GoogleFonts.cabin(
          fontSize: 20.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.lightGreen),
        )
      ),
      selectedItem: widget.initialValue as String?,
      showSelectedItem: true,
      showAsSuffixIcons: true,
      mode: Mode.DIALOG,
      showSearchBox: widget.showSearchBox,
      items: widget.items,
      label: widget.hintText,
      onChanged: widget.onChanged,
      // selectedItem: widget.items[0],
      validator: (String? item) {
        if (item == null) {
          return 'Required field';
        } else return null;
      },
    );
  }
}