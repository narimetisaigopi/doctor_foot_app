import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/utils/enums.dart';

class AppointmentModel {
  String docId;
  String doctorId;
  String uid;
  int amount;
  int appointmentId;
  AppointmentStatus appointmentStatus;
  String appointmentDate;
  String appointmentTime;
  Timestamp? timestamp;
  Timestamp? modifiedAt;
  PatientModel? patientModel;
  String paymentId;

  AppointmentModel(
      {this.docId = "",
      this.doctorId = "",
      this.uid = "",
      this.amount = 0,
      this.appointmentId = 0,
      this.appointmentStatus = AppointmentStatus.none,
      this.timestamp,
      this.appointmentDate = "",
      this.appointmentTime = "",
      this.modifiedAt,
      this.patientModel,
      this.paymentId = ""});

  // Convert model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'uid': uid,
      'amount': amount,
      "doctorId": doctorId,
      'appointmentStatus': appointmentStatus.index, // Store enum as index
      'timestamp': timestamp,
      'modifiedAt': modifiedAt,
      'appointmentId': appointmentId,
      "patientModel": patientModel != null ? patientModel!.toMap() : {},
      "paymentId": paymentId,
      "appointmentDate": appointmentDate,
      "appointmentTime": appointmentTime,
    };
  }

  // Create model from Firestore document snapshot
  factory AppointmentModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return AppointmentModel(
        docId: data['docId'] ?? "",
        uid: data['uid'] ?? "",
        doctorId: data["doctorId"] ?? "",
        amount: data['amount'] ?? 0,
        appointmentId: data["appointmentId"] ?? 0,
        appointmentStatus: data['appointmentStatus'] != null
            ? AppointmentStatus.values[data['appointmentStatus']]
            : AppointmentStatus.none, // Retrieve enum from index
        timestamp: data['timestamp'],
        patientModel: data["patientModel"] != null
            ? PatientModel.fromMap(data["patientModel"])
            : null,
        appointmentTime: data["appointmentTime"] ?? "",
        appointmentDate: data["appointmentDate"] ?? "",
        modifiedAt: data['modifiedAt'],
        paymentId: data["paymentId"] ?? "");
  }
}

class PatientModel {
  String name;
  String mobileNumber;
  int age;
  String gender;
  String bookingForWhom;

  PatientModel(
      {this.name = "",
      this.mobileNumber = "",
      this.age = 0,
      this.gender = "",
      this.bookingForWhom = ""});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobileNumber': mobileNumber,
      'age': age,
      'gender': gender,
      "bookingForWhom": bookingForWhom
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
        name: map['name'] ?? "",
        mobileNumber: map['mobileNumber'] ?? "",
        age: map['age'] ?? 0,
        gender: map['gender'] ?? "",
        bookingForWhom: map["bookingForWhom"] ?? "");
  }
}
