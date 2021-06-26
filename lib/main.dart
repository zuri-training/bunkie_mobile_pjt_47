import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(BunkieApp());
}

class BunkieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 630),
        builder: () => MultiProvider(
            providers: AppProvider.providers,
            child: MaterialApp(
              title: 'Bunkie',
              onGenerateRoute: RouteGenerator.onGenerateRoute,
              navigatorKey: locator<NavigationService>().navigatorKey,
              initialRoute: LandingViewRoute,
              debugShowCheckedModeBanner: false,
            )));
  }
}
