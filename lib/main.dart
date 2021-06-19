import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
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
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
