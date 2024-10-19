import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  int paymentId;
  int orderId;
  int doctorAppointmentId;
  int footServiceAppointmentId;
  AdminModel(
      {this.doctorAppointmentId = 1,
      this.footServiceAppointmentId = 1,
      this.paymentId = 1,
      this.orderId = 1});

  factory AdminModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return AdminModel(
        doctorAppointmentId: data["doctorAppointmentId"] ?? 1,
        paymentId: data["paymentId"] ?? 1,
        footServiceAppointmentId: data["footServiceAppointmentId"] ?? 1,
        orderId: data["orderId"] ?? 1);
  }

  Map<String, dynamic> toMap() {
    return {
      "doctorAppointmentId": doctorAppointmentId,
      "footServiceAppointmentId": footServiceAppointmentId,
      "paymentId": paymentId,
      "orderId": orderId
    };
  }
}
