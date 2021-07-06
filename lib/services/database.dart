import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:async/async.dart';

import 'package:bunkie/models/user.dart';


class DatabaseService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  
  static Stream<Iterable<CustomUser>>? streamUsers() {
    return _db
        .collection('users')
        .snapshots()
        .map((QuerySnapshot list) => list.docs
            .map((DocumentSnapshot snapshot) => 
              CustomUser.fromData(snapshot.data())
                ))
        .handleError((e) {
          print(e);
        });
  }

  static Stream<List<CustomUser>> getUsersByList(List<String> userIds) {
    final List<Stream<CustomUser>> streams = [];
    for (String id in userIds) {
      streams.add(_db
        .collection('users')
        .doc(id)
        .snapshots()
        .map((DocumentSnapshot snapshot) => 
          CustomUser.fromData(snapshot.data()))
      ); 
    }
    return StreamZip<CustomUser>(streams).asBroadcastStream();
  }

  /*static Stream<List<Conversation>> streamConversations(String uid) {
    return _db
        .collection('messages')
        .orderBy('lastMessage.timestamp', descending: true)
        .where('users', arrayContains: uid)
        .snapshots()
        .map((QuerySnapshot list) => list.docs
            .map((DocumentSnapshot snapshot) => 
              Conversation.fromFirestore(snapshot))
            .toList());
  }

  static void sendMessage(
    String convoID,
    String id,
    String pid,
    String content,
    String timestamp,
  ) {
    final DocumentReference convoDoc = 
      _db.collection('messages').doc(convoID);
    
    convoDoc.set(<String, dynamic> {
      'lastMessage': <String, dynamic>{
        'idFrom': id,
        'idTo': pid,
        'content': content,
        'timestamp': timestamp,
        'read': false,
      },
      'users': <String>[id, pid]
    }).then((dynamic success) {
      final DocumentReference messageDoc = _db
          .collection('messages')
          .doc(convoID)
          .collection(convoID)
          .doc(timestamp);

      _db.runTransaction((Transaction transaction) async {
        // ignore: await_only_futures
        await transaction.set(
          messageDoc, 
          <String, dynamic>{
            'idFrom': id,
            'idTo': pid,
            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
            'content': content,
            'read': false,
          },
        );
      });
    });
  }

  static void updateMessageStatus(DocumentSnapshot doc, String convoID) {
    final DocumentReference docRef = _db
        .collection('messages')
        .doc(convoID)
        .collection(convoID)
        .doc(doc.id);
    
    docRef.set(<String, dynamic>{'read': true}, SetOptions(merge: true));
  }

  static void updateLastMessage(
        DocumentSnapshot doc, String uid, String pid, String convoID) {
      final DocumentReference docRef = _db.
          collection('messages').doc(convoID);

      docRef
        .set(<String, dynamic> {
          'lastMessage': <String, dynamic>{
            'idFrom': doc['idFrom'],
            'idTo': doc['idTo'],
            'timestamp': doc['timestamp'],
            'content': doc['content'],
            'read': doc['read']
          },
          'users': <String>[uid, pid]
        })
        .then((dynamic success) => {})
        .catchError((dynamic e) {
          print(e);
        });
    }*/

  static void updateUserPresence(uid) async {
    Map<String, dynamic> presenceStatusTrue = {
      'presence': true,
      'last_seen': DateTime.now().millisecondsSinceEpoch,
    };

    await dbRef.child(uid)
        .update(presenceStatusTrue)
        .whenComplete(() => print('Updated'))
        .catchError((e) => print(e));
    
    Map<String, dynamic> presenceStatusFalse = {
      'presence': false,
      'last_seen': DateTime.now().millisecondsSinceEpoch,
    };

    dbRef.child(uid).onDisconnect().update(presenceStatusFalse);
  }

  static updateUserData(
        Map fields) {
      final DocumentReference docRef = _db.
          collection('users').doc(_auth.currentUser?.uid);
      
      fields.forEach((key, value) => docRef
        .update(<String, dynamic> {
          key: value
        })
        .then((dynamic success) => print("Successful"))
        .catchError((dynamic e) {
          print(e);
        }));
      
    }
}