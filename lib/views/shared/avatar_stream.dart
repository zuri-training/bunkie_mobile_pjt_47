import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/utils/utils.dart';

import 'package:bunkie/services/services.dart';


// ignore: must_be_immutable
class AvatarStream extends StatefulWidget {
  final User user;
  double? radius;

  AvatarStream({
    Key? key,
    required this.user,
    this.radius
  }) : super(key: key);
  
  @override
  _AvatarStreamState createState() => _AvatarStreamState();
}


class _AvatarStreamState extends State<AvatarStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: locator<FirestoreService>().getUser(widget.user.uid),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return Container();
        var user = snapshot.data;
        return CircleAvatar(
          foregroundImage: CachedNetworkImageProvider(
            user['avatar']
          ),
          backgroundImage: AssetImage('assets/images/landing-page-background.jpg'),
          radius: widget.radius ?? 25,
        );
      },
    );
  }
}