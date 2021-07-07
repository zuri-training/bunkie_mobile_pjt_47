import 'package:bunkie/views/views.dart';
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
        return _getPageRoute(LoginView());
      case LandingViewRoute:
        return _getPageRoute(LandingPageView());
      case SignUpViewRoute:
        return _getPageRoute(SignUpView());
      case VerifyEmailViewRoute:
        return _getPageRoute(VerifyEmailView());
      case VerifyNumberViewRoute:
        return _getPageRoute(VerifyNumberView());
      case CodeVerificationViewRoute:
        return _getPageRoute(CodeVerificationView());
      case AmenitiesViewRoute:
        return _getPageRoute(AmenitiesView());
      case InterestsAndLifestyleViewRoute:
        return _getPageRoute(InterestsAndLifeStyleView());
      case LookingForApartmentViewRoute:
        return _getPageRoute(LookingForApartmentView());
      case LookingForRoommateViewRoute:
        return _getPageRoute(LookingForRoomateView());
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
