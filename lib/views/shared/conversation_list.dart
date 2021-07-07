import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/utils/helpers.dart';
import 'package:google_fonts/google_fonts.dart';

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

  ConversationList({
    required this.name, 
    this.messageContent, 
    this.imageUrl,
    this.time,
    required this.messageRead,
    required this.uid,
    required this.pid,
    required this.contact,
    this.lastMessage
  });
  @override
  _ConversationListState createState() => _ConversationListState();
}


class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => createConversation(context),
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 10,
          bottom: 10
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.imageUrl ?? 'https://i.pravatar.cc/150?img=1',
                    ),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name, style: GoogleFonts.cabin(
                            fontSize: 16,
                            color: Colors.black
                          )),
                          SizedBox(height: 6),
                          Text(
                            widget.messageContent as String,
                            style: GoogleFonts.cabin(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: widget.messageRead ? FontWeight.bold : FontWeight.normal
                            ),
                          )
                        ]
                      ),
                    )
                  ),
                ],
              ),
            ),
            Text(
              widget.time.toString(),
              style: GoogleFonts.cabin(
                fontSize: 12,
                color: Colors.white,
                fontWeight: widget.messageRead ? FontWeight.bold : FontWeight.normal
              ),
            )
          ],
        )
      )
    );
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
