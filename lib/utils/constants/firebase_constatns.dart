import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference usersCollectionReference =
    FirebaseFirestore.instance.collection("users");

CollectionReference couponCodesCollectionReference =
    FirebaseFirestore.instance.collection("coupon_codes");

final List<String> adminsList = [
  "bandigowtham6@gmail.com",
];
bool amIAdmin() {
  String email = "";
  if (FirebaseAuth.instance.currentUser != null) {
    email = FirebaseAuth.instance.currentUser!.email ?? "";
  }

  return adminsList.contains(email);
}
