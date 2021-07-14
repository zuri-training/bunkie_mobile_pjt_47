import 'package:bunkie/services/navigation_service.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'roommate_search.dart';
import 'shared/custom_searchable_dropdown.dart';

class SearchView extends StatefulWidget {
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var _selectedUniversity;
  var _selectedGender;
  var _selectedAgeRange = '20 -';
  var _selectedBudgetRange;
  var _selectedLevel;

  var _splitAgeRange;
  var _splitBudgetRange;

  var searchQuery;

  @override
  Widget build(BuildContext context) {
    _splitAgeRange = convertRangeToList(_selectedAgeRange);

    searchQuery = FirebaseFirestore.instance.collection('users')
        .where('university', isEqualTo: _selectedUniversity)
        .where('gender', isEqualTo: _selectedGender)
        .where('id', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        // .where('level', isGreaterThanOrEqualTo: _selectedLevel)
        // .where('age', isGreaterThanOrEqualTo: _splitAgeRange[0])
        // .where('age', isLessThanOrEqualTo: _splitAgeRange[1])
        // .orderBy('level', descending: false)
        .limit(30);
        
    return ResponsiveWidget(
        onWillPop: () => locator<NavigationService>().goBack(),
        builder: (context, size) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text(
                  'Search Criteria',
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
              ),
              body: SingleChildScrollView(
                  child: Column(children: [
                CustomSpacer(flex: 2),
                Text('Input your matching criteria',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                        color: Colors.black, fontSize: 16.sp)),
                CustomSpacer(flex: 2),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w
                  ),
                  child:
                    Column(
                      children: [
                        CustomSearchableDropdown(
                          hintText: 'Select University', 
                          items: Universities,
                          onChanged: (val) => setState(() => 
                            _selectedUniversity = val),
                          //initialValue: Universities[0],
                          showSearchBox: true,
                        ),
                        CustomSpacer(flex: 2),
                        CustomSearchableDropdown(
                          hintText: 'Gender', 
                          items: ['Male', 'Female'],
                          onChanged: (val) {
                            setState(() => 
                            _selectedGender = val);
                          },
                          initialValue: 'Male',
                          showSearchBox: false,
                        ),
                        CustomSpacer(flex: 2),
                        CustomSearchableDropdown(
                          hintText: 'Level',
                          items: ['100', '200', '300', '400', '500', '600'],
                          onChanged: (val) => 
                            setState(() => _selectedLevel = val),
                          initialValue: '100',
                          showSearchBox: false,
                        ),
                        CustomSpacer(flex: 2),
                        CustomSearchableDropdown(
                          hintText: 'Age Range',
                          items: ['18-22', '23-25', '26-30', '31-40'],
                          onChanged: (val) => 
                            setState(() => _selectedAgeRange = val),
                          initialValue: '18-22',
                          showSearchBox: false,
                        ),
                        CustomSpacer(flex: 2),
                        CustomSearchableDropdown(hintText: 'Budget Range', items: [
                          '50,000.00 - 100,000.00',
                          '110,000.00 - 150,000.00',
                          '160,000.00 - 200,000.00',
                          ],
                          onChanged: (val) => 
                            setState(() => _selectedBudgetRange = val),
                          initialValue: '50,000.00 - 100,000.00',
                          showSearchBox: false,
                        ),
                      ],
                    )
                ),
                
                CustomSpacer(flex: 3),
                CustomButton(
                  text: 'Search',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return RoommateSearchView(
                        collection: searchQuery,
                      );
                    })
                  )
                ),
                CustomSpacer(flex: 3),
              ])));
        });
  }


  List<dynamic> convertRangeToList(dynamic range) {
    return range.split('-');
  }
}
