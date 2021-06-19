import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
              theme: ThemeData(
                primarySwatch: Colors.green,
              ),
              onGenerateRoute: RouteGenerator.onGenerateRoute,
              navigatorKey: locator<NavigationService>().navigatorKey,
              initialRoute: LoginViewRoute,
            )));
  }
}
