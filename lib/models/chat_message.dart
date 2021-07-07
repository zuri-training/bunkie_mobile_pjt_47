
import 'package:cloud_firestore/cloud_firestore.dart';


class Conversation {
  String id;
  List<dynamic> userIds;
  Map<dynamic, dynamic> lastMessage;

  Conversation({required this.id, required this.userIds, required this.lastMessage});

  factory Conversation.fromFirestore(DocumentSnapshot doc) {
    final Map<String, dynamic>? data = doc.data();

    return Conversation(
      id: doc.id,
      userIds: data!['users'] ?? <dynamic> [],
      lastMessage: data['lastMessage'] ?? <dynamic> {},
    );
  }
}

class Message {
  String id;
  String content;
  String idFrom;
  String idTo;
  DateTime timestamp;

  Message({
    required this.id, 
    required this.content,
    required this.idFrom,
    required this.idTo,
    required this.timestamp
  });

  factory Message.fromFirestoreDocument(DocumentSnapshot doc) {
    final Map<String, dynamic>? data = doc.data();

    return Message(
      id: doc.id,
      content: data!['content'] ?? '',
      idFrom: data['idFrom'],
      idTo: data['idTo'],
      timestamp: data['timestamp'],
    );
  }
}