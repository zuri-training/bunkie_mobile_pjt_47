import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/locator.dart';
import 'package:flutter/material.dart';

///Base view model with shared dependencies injected.
///All view models must extends this class.
class BaseViewModel extends ChangeNotifier {
  late NavigationService navigationService;

  BaseViewModel({NavigationService? navigationService}) {
    this.navigationService = navigationService ?? locator<NavigationService>();
  }
}
