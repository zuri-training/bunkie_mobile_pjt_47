import 'package:bunkie_mobile_pjt_47/utils/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BunkieApp());
}

class BunkieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bunkie',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
