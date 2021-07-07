import 'package:bunkie/models/chat_message.dart';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:bunkie/views/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';


class ChatPageView extends StatefulWidget {
  const ChatPageView({Key? key}): super(key: key);
  @override
  _ChatPageViewState createState() => _ChatPageViewState();
}


class _ChatPageViewState extends State<ChatPageView> {

  var snap;
  String name = '';
  String content = '';

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference firestoreUsers = FirebaseFirestore.instance.collection('users');
  
  AuthService _authService = AuthService();
  Query? messages;      

  @override
  Widget build(BuildContext context) {
    messages = DatabaseService.db.collection('messages')
      // .orderBy('lastMessage.timestamp', descending: true)
      .where('users', arrayContains: _auth.currentUser!.uid);
      
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
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.green[800],
          leading: GestureDetector(
            onTap: () => locator<NavigationService>().goBack(),
            child: Container(
              height: 15.h,
              width: 6.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(
                  color: Colors.green.withAlpha(90),
                  blurRadius: 2,
                )],
              ),
              child: Icon(
                Icons.arrow_back,
                size: 25.w
              ),   
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 4.w, top: 4.h, bottom: 4.h),
              child: Container(
                padding: EdgeInsets.only(
                  left: 8.w,
                  right: 8.w,
                  top: 2.h,
                  bottom: 2.h
                ),
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green
                ),
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.pink, size: 20,),
                    SizedBox(width: 1.5),
                    Text('Start New', style: GoogleFonts.cabin(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),)]
                  )
                )
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [              
                Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white70,),
                      hintText: 'Search...',
                      hintStyle: GoogleFonts.cabin(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                      filled: true,
                      fillColor: Colors.teal
                    ),
                  ),
                ),
                CustomSpacer(flex: 2),
                StreamBuilder<QuerySnapshot>(
                  stream: firestoreUsers.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot1) {
                    return StreamBuilder<QuerySnapshot>(
                      stream: messages?.snapshots(),
                      builder: (context, snapshot2) {
                        if (snapshot1.hasError || snapshot2.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot1.connectionState == ConnectionState.waiting || 
                            snapshot2.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator.adaptive();
                        }
                        else if (snapshot1.hasData || snapshot1.data != null) {
                          var data = snapshot1.data!.docs;
                          var messageData = snapshot2.data!.docs;

                          return ListView.separated(
                            shrinkWrap: true,
                            itemCount: messageData.length,
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.green[800],
                              height: 0,
                              thickness: 1,
                            ),
                            itemBuilder: (context, index) {
                              print(messageData[index]['lastMessage']);
                              print(messageData.length);
                              data.forEach((element) {
                                if (element['id'] == messageData[index]['users'][1]) {
                                  print(element['firstName']);
                                  name = element['firstName'];
                                  snap = element;                      
                                }
                                
                              });
                                  
                              return ConversationList(
                                      name: name,
                                      messageContent: messageData[index]['lastMessage.content'].trim(),
                                      // imageUrl: data[index]['photoURL'],
                                      // time: messageData[index]['lastMessage.timestamp'],
                                      messageRead: (index == 0 || index == 3) ? 
                                        true : false,
                                      uid: _auth.currentUser!.uid,
                                      pid: messageData[index]['users'][1],
                                      contact: snap,
                                  );
                            },
                          );
                        }
                        return Text('Loading');
                      }                    
                    );
                  },
                ),
              ]
            )
          ),
        );
      }
    );
    
  }
}