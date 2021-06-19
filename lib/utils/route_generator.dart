import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bunkie_mobile_pjt_47/utils/utils.dart';

class RouteGenerator {
  ///Generates routes, extracts and passes navigation arguments.
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen:
        //TODO: Replace with actual SplashScreen widget
        return _getPageRoute(Container());
      default:
        return _getPageRoute(_errorPage);
    }
  }

  //Wraps widget with a CupertinoPageRoute and adds route settings
  static CupertinoPageRoute _getPageRoute(
    Widget child, [
    String? routeName,
    dynamic? args,
  ]) =>
      CupertinoPageRoute(
        builder: (context) => child,
        settings: RouteSettings(
          name: routeName,
          arguments: args,
        ),
      );

  ///Error page shown when app attempts navigating to an unknown route
  static Widget _errorPage = Scaffold(
    appBar: AppBar(
        title: Text(
      'Page not found',
      style: TextStyle(color: Colors.red),
    )),
    body: Center(
      child: Text(
        'Error! Page not found',
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}
