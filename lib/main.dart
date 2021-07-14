import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:bunkie/views/landing_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/user_presence.dart';
import 'views/shared/dismiss_keyboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(ScreenUtilInit(
      designSize: Size(360, 630),
      builder: () => MultiProvider(
          providers: AppProvider.providers,
          child: DismissKeyboard(
              child: MaterialApp(
              title: 'Bunkie',
              onGenerateRoute: RouteGenerator.onGenerateRoute,
              navigatorKey: locator<NavigationService>().navigatorKey,
              home: BunkieApp(),
              debugShowCheckedModeBanner: false,
            )
          )       
        )));
}

class BunkieApp extends StatefulWidget {
  @override
  _BunkieAppState createState() => _BunkieAppState();
}

class _BunkieAppState extends State<BunkieApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialise Flutterfire
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator.adaptive()),
            );
          }
          if (snapshot.hasError) {
            locator<NavigationService>().pushNamed('Error');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final FirebaseAuth _auth = FirebaseAuth.instance;
            if (_auth.currentUser != null) {
              print('User is registered');
              UserPresence.rtDbAndLocalPresence(Firebase.app());
              _isLoggedIn = true;
            }
            _auth.authStateChanges().listen((User? user) {
              if (user == null) {
                print('User is currently signed out');
                _isLoggedIn = false;
              } else {
                print('User is currently signed in');
                _isLoggedIn = true;
              }
            });
            return LandingPageView();
          }

          return Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          );
        });
  }
}
