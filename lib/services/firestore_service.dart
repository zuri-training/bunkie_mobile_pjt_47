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

  Future<dynamic> getUser(String uid) async {
    try {
      Map userMap = {};
      var userData =
          await _users.doc(uid).get().then((DocumentSnapshot docSnapshot) {
        if (docSnapshot.exists) {
          //print(CustomUser.fromData(docSnapshot.data()).email);
          // return CustomUser.fromFirestore(docSnapshot);
          docSnapshot.data()!.forEach((key, value) {
            userMap[key] = value;
          });
          return userMap;
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

  Future<String> getUserFirstName(String uid) async {
    String firstName;
    var data = await _users.doc(uid).get();
    firstName = data.data()!['firstName'].toString();
    log('FirstName is $firstName');
    return firstName;
  }

  Future<String> getUserFirstAndLastName(String uid) async {
    String firstName;
    String lastName;
    String fullName;
    var data = await _users.doc(uid).get();
    firstName = data.data()!['firstName'].toString();
    lastName = data.data()!['lastName'].toString();
    fullName = firstName + ' $lastName';
    log('FullName is $fullName');
    return fullName;
  }
}
