import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  int paymentId;
  int orderId;
  int appointmentId;
  AdminModel({this.appointmentId = 0, this.paymentId = 0, this.orderId = 0});

  factory AdminModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return AdminModel(
        appointmentId: data["appointmentId"] ?? 0,
        paymentId: data["paymentId"] ?? 0,
        orderId: data["orderId"] ?? 0);
  }

  Map<String, dynamic> toMap() {
    return {
      "appointmentId": appointmentId,
      "paymentId": paymentId,
      "orderId": orderId
    };
  }
}
