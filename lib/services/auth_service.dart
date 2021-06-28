import 'package:firebase_auth/firebase_auth.dart';

import 'firestore_service.dart';
import 'package:bunkie/models/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStoreService _fireStoreService = FireStoreService();
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future signUpEmailAndPassword({
    String username: '',
    required String email, 
    required String password,
    String avatar: '',
    required String firstName,
    required String lastName,
    }) async {
    try {
      UserCredential result = await 
      _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );  
      User? user = result.user;
      await _fireStoreService.createUser(CustomUser(
        id: result.user!.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
      ));
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  } 

  Future signinWithEmail(String email, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
    } on FirebaseAuthException catch(e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided. Please check your password');
      }
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future updateProfile(String username, String photoUrl) async {
    User? user = _auth.currentUser;
    if (user != null) {
      // ignore: unused_local_variable
      UserInfo profile = UserInfo(
        {username: username, 
        photoUrl: photoUrl
      });
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> isLoggedIn() async {
    var user = _auth.currentUser;
    return user != null;
  }

  /*Stream<QuerySnapshot> readItems() {
    final CollectionReference _mainCollection = _firestore.collection('users');
    CollectionReference usersCollection = _mainCollection.doc().collection('users');
    return usersCollection.snapshots();
  }
  */
}