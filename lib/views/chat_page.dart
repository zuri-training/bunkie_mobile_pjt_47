
import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPageView extends StatefulWidget {
  const ChatPageView({Key? key}) : super(key: key);
  @override
  _ChatPageViewState createState() => _ChatPageViewState();
}

class _ChatPageViewState extends State<ChatPageView> {
  var contact;
  String name = '';
  String content = '';

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference firestoreUsers =
      FirebaseFirestore.instance.collection('users');

  AuthService _auth = AuthService();
  Query? messages;

  @override
  Widget build(BuildContext context) {
    messages = DatabaseService.db
        .collection('messages')
        // .orderBy('lastMessage.timestamp', descending: true)
        .where('users', arrayContains: _auth.currentUser()!.uid);

    return ResponsiveWidget(
        onWillPop: () => locator<NavigationService>().goBack(),
        builder: (context, size) {
          return Scaffold(
            bottomNavigationBar: BottomNavBar(),
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                'Messages',
                style: GoogleFonts.cabin(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              //centerTitle: true,
              backgroundColor: Colors.green[800],
              leading: GestureDetector(
                onTap: () => locator<NavigationService>().goBack(),
                child: Container(
                  height: 15.h,
                  width: 6.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withAlpha(90),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Icon(Icons.arrow_back, size: 25.w),
                ),
              ),
              actions: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.w, top: 5.w),
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.search_rounded,
                              size: 25, color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w, top: 5.w),
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.more_vert_sharp,
                              size: 25, color: Colors.white)),
                    ),
                  ],
                )
              ],
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: firestoreUsers.snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot1) {
                          return StreamBuilder<QuerySnapshot>(
                              stream: messages?.snapshots(),
                              builder: (context, snapshot2) {
                                if (snapshot1.hasError || snapshot2.hasError) {
                                  return Text('Something went wrong');
                                }
                                if (snapshot1.connectionState ==
                                        ConnectionState.waiting ||
                                    snapshot2.connectionState ==
                                        ConnectionState.waiting) {
                                  return CircularProgressIndicator.adaptive();
                                } else if (snapshot1.hasData ||
                                    snapshot1.data != null) {
                                  // All users in collection
                                  var allUsers = snapshot1.data!.docs;
                                  var messageData = snapshot2.data!.docs;
                                  
                                  // List to hold user IDs in conversations
                                  List userIdsInConvo = [];

                                  return ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: messageData.length,
                                    separatorBuilder: (context, index) =>
                                        Divider(
                                      color: Colors.black,
                                      height: 0,
                                      thickness: 1,
                                      indent: 80,
                                    ),
                                    itemBuilder: (context, index) {
                                      var lastMsg = messageData[index]['lastMessage'];

                                      // Add IDs of the two users in conversation to list
                                      userIdsInConvo.addAll([lastMsg['idTo'], lastMsg['idFrom']]);

                                      allUsers.forEach((element) {
                                        if (element['id'] != _auth.currentUser()!.uid && 
                                            userIdsInConvo.contains(element['id'])) {
                                              
                                          name = element['firstName'];
                                          contact = element;
                                          print(contact['id']);
                                        }
                                      });

                                      return ConversationList(
                                        name: name,
                                        messageContent: messageData[index]
                                                ['lastMessage.content']
                                            .trim(),
                                        // imageUrl: data[index]['photoURL'],
                                        // time: messageData[index]['lastMessage.timestamp'],
                                        messageRead: (index == 0 || index == 3)
                                            ? true
                                            : false,
                                        uid: _auth.currentUser()!.uid,
                                        pid: contact['id'],
                                        contact: contact,
                                      );
                                    },
                                  );
                                }
                                return Text('Loading');
                              });
                        },
                      ),
                    ])),
          );
        });
  }
}
