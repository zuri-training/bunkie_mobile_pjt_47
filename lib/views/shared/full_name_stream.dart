import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';

class FullNameStream extends StatefulWidget {
  final User loggedInUser;
  final TextStyle style;

  const FullNameStream({
    Key? key,
    required this.loggedInUser,
    required this.style,
  }) : super(key: key);

  @override
  _FullNameStreamState createState() => _FullNameStreamState();
}

class _FullNameStreamState extends State<FullNameStream> {
  String? fullName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: locator<FireStoreService>()
            .getUserFirstAndLastName(widget.loggedInUser.uid),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            log('User is null');
            return Container();
          }

          fullName = snapshot.data.toString();

          return Text(
            '$fullName',
            style: widget.style,
          );
        });
  }
}
