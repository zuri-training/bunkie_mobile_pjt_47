import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/locator.dart';
import 'package:flutter/material.dart';

///Base view model with shared dependencies injected.
///All view models must extends this class.
class BaseViewModel extends ChangeNotifier {
  late NavigationService navigationService;
  late FirestoreService firestoreService;
  late AuthService authService;

  BaseViewModel({
      NavigationService? navigationService,
      FirestoreService? firestoreService,
      AuthService? authService
    }) {
    this.navigationService = navigationService ?? locator<NavigationService>();
    this.firestoreService = firestoreService ?? locator<FirestoreService>();
    this.authService = locator<AuthService>();
  }
}
