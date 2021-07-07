
import 'package:bunkie/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:bunkie/services/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/shared.dart';


// ignore: must_be_immutable
class ChatDetailView extends StatefulWidget {
  final String uid;
  final QueryDocumentSnapshot contact;
  final String convoID;
  String photoURL;

  ChatDetailView({
    required this.uid, 
    required this.contact, 
    required this.convoID,
    required this.photoURL
  });

  @override
  _ChatDetailViewState createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  late String convoID;
  late QueryDocumentSnapshot contact;
  List<DocumentSnapshot>? listMessage;
  late final String uid;
  late String photoURL;

  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
      uid = widget.uid;
      convoID = widget.convoID;
      contact = widget.contact;
      photoURL = widget.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    Query firestoreMsgs = 
    FirebaseFirestore
      .instance
      .collection('messages')
      .doc(convoID)
      .collection(convoID)
      .orderBy('timestamp', descending: true);

    return 
      ResponsiveWidget(
        onWillPop: () => locator<NavigationService>().goBack(),
        builder: (context, size) {
          return Scaffold(
            appBar: AppBar(
              // title: Text('Chat Detail'),
              backgroundColor: Colors.green[800],
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: SafeArea(child: Container(
                padding: EdgeInsets.only(right: 16.w),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => locator<NavigationService>().goBack(),
                      icon: Icon(Icons.arrow_back),         
                    ),
                    SizedBox(width: 2),
                    CircleAvatar(
                      backgroundImage: 
                        NetworkImage(photoURL),
                      maxRadius: 20,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          contact['firstName'],
                          style: GoogleFonts.cabin(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Online',
                          style: GoogleFonts.cabin(
                            fontSize: 13.sp,
                            color: Colors.cyanAccent
                          ), 
                        )
                      ],
                    )),
                    Icon(Icons.settings)
                  ],
                ),
              )),

            ),
            body: Stack(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: firestoreMsgs.snapshots(),
                  builder: (
                    BuildContext context, 
                    AsyncSnapshot<QuerySnapshot> snapshot
                  ) {
                    if (snapshot.hasData || snapshot.data != null) {
                      listMessage = snapshot.data!.docs;
                      
                      return ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        physics: BouncingScrollPhysics(),
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: listMessage!.length,
                        itemBuilder: (BuildContext context, index) {
                          var doc = listMessage![index];
                          if (!doc['read'] && doc['idTo'] == uid) {
                            DatabaseService.updateMessageStatus(doc, convoID);
                          }
                          return Container(
                            padding: EdgeInsets.only(
                              left: 16.w,
                              right: 16.w,
                              top: 10.h,
                              bottom: 10.h
                            ),
                            child: Align(
                              // If my message, align to the right, 
                              // else align left
                              alignment: doc['idFrom'] == uid ? 
                                Alignment.topRight : Alignment.topLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: doc['idFrom'] == uid ? Colors.deepOrange : Colors.lightBlue, 
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  doc['content'],
                                  style: TextStyle(color: Colors.white70)
                                )
                              )
                            ),
                          );
                        }
                      );
                    }
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    } else if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator.adaptive()
                      );
                    }
                    return Center(child: CircularProgressIndicator.adaptive());
                  }
                ),
                
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      bottom: 10.h,
                      top: 10.h,
                    ),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.green[800],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white70,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            autocorrect: true,
                            controller: textController,
                            decoration: InputDecoration(
                              hintText: 'Write message',
                              hintStyle: GoogleFonts.cabin(),
                              border: InputBorder.none,
                            ),
                          )
                        ),
                        SizedBox(width: 15),
                        FloatingActionButton(
                          backgroundColor: Colors.green[800],
                          onPressed: () => onSend(textController.text),
                          child: Icon(Icons.send, size: 18),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      );
    
  }
  
  void onSend(String content) {
    if (content.trim() != '') {
      // If content is not empty string, set text controller to empty
      textController.clear();
      content = content.trim();
      DatabaseService.sendMessage(convoID, uid, contact.id, content,
          DateTime.now().millisecondsSinceEpoch.toString());
    }
  }
}