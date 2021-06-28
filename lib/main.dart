import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(BunkieApp());
}

class BunkieApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialise Flutterfire
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          locator<NavigationService>().pushNamed('Error');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          final FirebaseAuth _auth = FirebaseAuth.instance;
          if (_auth.currentUser != null) {
            print('User is registered');
            _isLoggedIn = true;
          }
          _auth.authStateChanges()
            .listen((User? user) {
              if (user == null) {
                print('User is currently signed out');
                _isLoggedIn = false;
              } else {
                print('User is is currently signed out');
                _isLoggedIn = true;
              }
          });
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

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive()
            ),
          );

        }
    );
  }
    
}