import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserPresence {
  static final FirebaseApp app = Firebase.app();
  static final FirebaseDatabase db = FirebaseDatabase(
    app: app,
    databaseURL: 'https://bunkie-54bf1-default-rtdb.firebaseio.com/'
  );

  static rtDbAndLocalPresence(app) async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var userStatusDbRef = db.reference().child('/status' + uid);
    var userStatusFirestoreRef = 
      FirebaseFirestore.instance.
        collection('status').doc(uid);
    
    var isOfflineForDb = {
      'state': 'offline',
      'last_changed': ServerValue.timestamp
    };

    var isOnlineForDb = {
      'state': 'online',
      'last_changed': ServerValue.timestamp
    };
    
    var isOfflineForFirestore = {
      'state': 'offline',
      'last_changed': DateTime.now().millisecondsSinceEpoch
    };

    var isOnlineForFirestore = {
      'state': 'online',
      'last_changed': DateTime.now().millisecondsSinceEpoch
    };

    db
    .reference()
    .child('.info/connected')
    .onValue
    .listen((Event event) async {
      if (event.snapshot.value == false) {
        userStatusFirestoreRef.update(isOfflineForFirestore);
        return;
      }

      await userStatusDbRef
        .onDisconnect()
        .update(isOfflineForDb)
        .then((value) => {
          userStatusDbRef.set(isOnlineForDb)
        });
      
      userStatusFirestoreRef.update(isOnlineForFirestore);
    });

  }
}