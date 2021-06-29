import 'package:bunkie/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference _users = FirebaseFirestore.instance.collection("users");

  Future createUser(CustomUser user) async {
    try {
      await _users.doc(user.id).set(user.toJson());
    } catch(e) {
      return e.toString();
    }
  }

  Future updateUserProfile(CustomUser user) async {
    try {
      await _users.doc(user.id).set(user.toJson());
    } catch(e) {
      return e.toString();
    }
  }

  Future<CustomUser?> getUser(String uid) async {
    try {
      var userData = await _users.doc(uid).get().then(
        (DocumentSnapshot docSnapshot) {
          if (docSnapshot.exists) {
            print('Document data: ${docSnapshot.data()}');
            print(CustomUser.fromData(docSnapshot.data()).email);
            return CustomUser.fromData(docSnapshot.data());
          } else {
            print('Document does not exist on the database');
          }
        }
      );
      return userData;
    } catch(e) {
      print(e);
    }
    // throw Exception;
  }

  Future getUserName() async {
    try {
      await _users.doc().get().then(
        (DocumentSnapshot docSnapshot) {
          if (docSnapshot.exists) {
            var data = docSnapshot.data();
            print('Document data: ${data!['email']}');
            return CustomUser.fromData(data['email']);
          } else {
            print('Document does not exist');
          }
        }
      );
    } catch(e) {
      return e.toString();
    }
  }
  

}