import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/utils/helpers.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bunkie/utils/utils.dart';

import '../chat_detail.dart';

// ignore: must_be_immutable
class ConversationList extends StatefulWidget {
  String name;
  String? messageContent;
  String? imageUrl;
  String? time;
  bool messageRead;
  String uid;
  String pid;
  String? lastMessage;
  QueryDocumentSnapshot contact;

  ConversationList(
      {required this.name,
      this.messageContent,
      this.imageUrl,
      this.time,
      required this.messageRead,
      required this.uid,
      required this.pid,
      required this.contact,
      this.lastMessage});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => createConversation(context),
        child: Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h, bottom: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          widget.imageUrl ?? 'https://i.pravatar.cc/150?img=1',
                        ),
                        maxRadius: 26,
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                          child: Container(
                        color: Colors.transparent,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.name,
                                  style: GoogleFonts.cabin(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.sp, 
                                      color: Colors.black)),
                              SizedBox(height: 6.h),
                              Container(
                                width: 220,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                            style: GoogleFonts.cabin(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: widget.messageRead
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                            text: widget.messageContent
                                                as String),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      )),
                    ],
                  ),
                ),
                Text(
                  widget.time.toString(),
                  style: GoogleFonts.cabin(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: widget.messageRead
                          ? FontWeight.bold
                          : FontWeight.normal),
                )
              ],
            )));
  }

  void createConversation(BuildContext context) {
    String convoID = Helpers.getConvoID(widget.uid, widget.pid);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ChatDetailView(
              uid: widget.uid,
              contact: widget.contact,
              convoID: convoID,
              photoURL: widget.imageUrl ?? 'https://i.pravatar.cc/150?img=1',
            )));
  }
}
