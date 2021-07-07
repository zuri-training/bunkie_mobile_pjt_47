import 'package:bunkie/views/chat_page.dart';
import 'package:bunkie/views/login_view.dart';
import 'package:bunkie/views/profile_create.dart';
import 'package:bunkie/views/roommate_preferences.dart';
import 'package:bunkie/views/roommate_search.dart';

import 'package:bunkie/views/selection_view.dart';
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
      case ProfileCreateViewRoute:
        return _getPageRoute(ProfileCreate());
      case SelectionViewRoute:
        return _getPageRoute(SelectionView());
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
      case RoommatePreferencesViewRoute:
        return _getPageRoute(RoommatePreferencesView());
      case RoommateSearchViewRoute:
        return _getPageRoute(RoommateSearchView());
      case EditProfileViewRoute:
        return _getPageRoute(EditProfileView());
      case HelpViewRoute:
        return _getPageRoute(HelpView());
      case NotificationsSettingsViewRoute:
        return _getPageRoute(NotificationsSettingsView());
      case SettingsViewRoute:
        return _getPageRoute(SettingsView());
      case UserVerificationViewRoute:
        return _getPageRoute(UserVerificationView());
      case UserDocumentVerificationViewRoute:
        return _getPageRoute(UserDocumentVerificationView());
      case LiveShotVerificationViewRoute:
        return _getPageRoute(LiveShotVerificationView());
      case MenuViewRoute:
        return _getPageRoute(MenuView());
      case SearchViewRoute:
        return _getPageRoute(SearchView());
      case UserProfileViewRoute:
        return _getPageRoute(UserProfileView());
      case RoommateProfileViewRoute:
        return _getPageRoute(RoommateProfileView());
      case ApartmentSearchViewRoute:
        return _getPageRoute(ApartmentSearchView());
      case SearchRoomViewRoute:
        return _getPageRoute(SearchRoomView());
      case NotificationsViewRoute:
        return _getPageRoute(NotificationsView());
      case EmptyNotificationsViewRoute:
        return _getPageRoute(EmptyNotifications());

      case UserMessagesViewRoute:
        return _getPageRoute(UserMessagesView());
      case ChatPageViewRoute:
        return _getPageRoute(ChatPageView());
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
      ),
      backgroundColor: Colors.red,
    ),
    body: Center(
      child: Text(
        'Error! Page not found or not implemented yet',
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}
