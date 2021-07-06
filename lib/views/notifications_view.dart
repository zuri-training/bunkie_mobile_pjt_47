import 'package:flutter/material.dart';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';

class NotificationsView extends StatefulWidget {
  _NotificationsView createState() => _NotificationsView();
}

class _NotificationsView extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          centerTitle: true,
          backgroundColor: Colors.green[800],
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
                        backgroundImage: AssetImage('assets/images/user.jpeg'),
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
                    SizedBox(width: MediaQuery.of(context).size.width / 8),
                    Spacer(flex: 2),
                    CircleAvatar(
                      backgroundColor: Colors.green[800],
                      radius: 5,
                      child: Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green[800],
                      )),
                    )
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
                        backgroundImage: AssetImage('assets/images/user.jpeg'),
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
                    SizedBox(width: MediaQuery.of(context).size.width / 8),
                    CircleAvatar(
                      backgroundColor: Colors.green[800],
                      radius: 5,
                      child: Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green[800],
                      )),
                    )
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
                        backgroundImage: AssetImage('assets/images/user.jpeg'),
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
                    SizedBox(width: MediaQuery.of(context).size.width / 8),
                    CircleAvatar(
                      backgroundColor: Colors.green[800],
                      radius: 5,
                      child: Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green[800],
                      )),
                    )
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
                        backgroundImage: AssetImage('assets/images/user.jpeg'),
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
                    SizedBox(width: MediaQuery.of(context).size.width / 8),
                    CircleAvatar(
                      backgroundColor: Colors.green[800],
                      radius: 5,
                      child: Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green[800],
                      )),
                    )
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
                        backgroundImage: AssetImage('assets/images/user.jpeg'),
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
                    SizedBox(width: MediaQuery.of(context).size.width / 8),
                    CircleAvatar(
                      backgroundColor: Colors.green[800],
                      radius: 5,
                      child: Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green[800],
                      )),
                    )
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
                        backgroundImage: AssetImage('assets/images/user.jpeg'),
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
                    SizedBox(width: MediaQuery.of(context).size.width / 8),
                    CircleAvatar(
                      backgroundColor: Colors.green[800],
                      radius: 5,
                      child: Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green[800],
                      )),
                    )
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
                        backgroundImage: AssetImage('assets/images/user.jpeg'),
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
                    SizedBox(width: MediaQuery.of(context).size.width / 8),
                    CircleAvatar(
                      backgroundColor: Colors.green[800],
                      radius: 5,
                      child: Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green[800],
                      )),
                    )
                  ]),
                )),
              )
            ])));
  }
}

class EmptyNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Center(
        child: Image.asset('assets\images\NotBell.png'),
      ),
    );
  }
}
