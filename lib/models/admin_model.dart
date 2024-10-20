import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  int paymentId;
  int orderId;
  int doctorAppointmentId;
  int footAppointmentId;
  AdminModel(
      {this.doctorAppointmentId = 1,
      this.footAppointmentId = 1,
      this.paymentId = 1,
      this.orderId = 1});

  factory AdminModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return AdminModel(
        doctorAppointmentId: data["doctorAppointmentId"] ?? 1,
        paymentId: data["paymentId"] ?? 1,
        footAppointmentId: data["footAppointmentId"] ?? 1,
        orderId: data["orderId"] ?? 1);
  }

  Map<String, dynamic> toMap() {
    return {
      "doctorAppointmentId": doctorAppointmentId,
      "footAppointmentId": footAppointmentId,
      "paymentId": paymentId,
      "orderId": orderId
    };
  }
}
