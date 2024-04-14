import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
// instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// sign user in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      //signin
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      // after creating the user, create a new document for the user does't already exist
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'pass': password,
      }, SetOptions(merge: true));
      return userCredential;
    }
    // catch error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // create a new user
  Future<UserCredential> signupInWithEmailAndPassword(
      String email, String password) async {
    try {
      //signup
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // after creating the user, create a new document for the user in the users collection
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'pass': password,
      });
      return userCredential;
    }
    // catch error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign user out
  Future<void> signout() async {
    return await FirebaseAuth.instance.signOut();
  }
}
