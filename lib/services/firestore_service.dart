import 'dart:async';
import 'dart:developer';

import 'package:bunkie/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");

  Future createUser(CustomUser user) async {
    try {
      await _users.doc(user.id).set(user.toJson());
    } catch (e) {
      return e.toString();
    }
  }

  Future<CustomUser?> getUser(String uid) async {
    try {
      var userData =
          await _users.doc(uid).get().then((DocumentSnapshot docSnapshot) {
        if (docSnapshot.exists) {
          print('Document data: ${docSnapshot.data()}');
          print(CustomUser.fromData(docSnapshot.data()).email);
          return CustomUser.fromData(docSnapshot.data());
        } else {
          print('Document does not exist on the database');
        }
      });
      return userData;
    } catch (e) {
      print(e);
    }
    // throw Exception;
  }

  Stream<String> getUserFirstName(String uid) async* {
    String firstName;
    var data = await _users.doc(uid).get();
    firstName = data.data()!['firstName'].toString();
    log('FirstName is $firstName');
    yield firstName;
  }

  Stream<String> getUserFirstAndLastName(String uid) async* {
    String firstName;
    String lastName;
    String fullName;
    var data = await _users.doc(uid).get();
    firstName = data.data()!['firstName'].toString();
    lastName = data.data()!['lastName'].toString();
    fullName = firstName + ' $lastName';
    log('FullName is $fullName');
    yield fullName;
  }
}
