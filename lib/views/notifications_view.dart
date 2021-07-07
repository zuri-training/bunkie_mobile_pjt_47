import 'package:flutter/material.dart';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'shared/responsive_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsView extends StatefulWidget {
  _NotificationsView createState() => _NotificationsView();
}

class _NotificationsView extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        onWillPop: () => locator<NavigationService>().goBack(),
        builder: (context, size) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.green[800],
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    locator<NavigationService>().goBack();
                  },
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w, top: 20.w),
                    child: GestureDetector(
                      onTap: () {
                        locator<NavigationService>()
                            .pushNamed(EmptyNotificationsViewRoute);
// locator<NavigationService>().pushNamed(SettingsViewRoute);
                      },
                      child: Text(
                        'Done',
                        style: GoogleFonts.cabin(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/landing-page-background.jpg'),
                              radius: 25),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('We found a new match for you'),
                                Text('Tap to view profile'),
                              ]),
                        ]),
                      )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/landing-page-background.jpg'),
                              radius: 25),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('We found a new match for you'),
                                Text('Tap to view profile'),
                              ]),
                        ]),
                      )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/landing-page-background.jpg'),
                              radius: 25),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('We found a new match for you'),
                                Text('Tap to view profile'),
                              ]),
                        ]),
                      )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/landing-page-background.jpg'),
                              radius: 25),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('We found a new match for you'),
                                Text('Tap to view profile'),
                              ]),
                        ]),
                      )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/landing-page-background.jpg'),
                              radius: 25),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('We found a new match for you'),
                                Text('Tap to view profile'),
                              ]),
                        ]),
                      )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/landing-page-background.jpg'),
                              radius: 25),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('We found a new match for you'),
                                Text('Tap to view profile'),
                              ]),
                        ]),
                      )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/landing-page-background.jpg'),
                              radius: 25),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('We found a new match for you'),
                                Text('Tap to view profile'),
                              ]),
                        ]),
                      )),
                    )
                  ])));
        });
  }
}
