import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  int paymentId;
  AdminModel({this.paymentId = 0});

  factory AdminModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return AdminModel(
      paymentId: data["paymentId"] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {"paymentId": paymentId};
  }
}
