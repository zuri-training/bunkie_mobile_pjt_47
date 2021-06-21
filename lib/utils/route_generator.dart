import 'package:bunkie/views/login_view.dart';
import 'package:bunkie/views/profile_create.dart';
import 'package:bunkie/views/selection_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/utils/utils.dart';

class RouteGenerator {
  ///Generates routes, extracts and passes navigation arguments.
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreenViewRoute:
        //TODO: Replace with actual SplashScreen widget
        return _getPageRoute(Container());
      case LoginViewRoute:
        //TODO: Replace with actual SplashScreen widget
        return _getPageRoute(LoginView());
      case ProfileCreateViewRoute:
        return _getPageRoute(ProfileCreate());
      case SelectionViewRoute:
        return _getPageRoute(SelectionView());
      default:
        return _getPageRoute(_errorPage);
    }
  }

  //Wraps widget with a CupertinoPageRoute and adds route settings
  static CupertinoPageRoute _getPageRoute(
    Widget child, [
    String? routeName,
    dynamic args,
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
