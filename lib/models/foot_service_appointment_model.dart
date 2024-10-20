import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/address_model.dart';
import 'package:drfootapp/models/foot_service_model.dart';
import 'package:drfootapp/models/patient_model.dart';
import 'package:drfootapp/utils/enums.dart';

class FootServiceAppointmentModel {
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
  AddressModel? addressModel;
  FootServiceModel? footServiceModel;
  String paymentId;
  String cancelledByUid;
  DoctorAppointmentType appointmentType;

  FootServiceAppointmentModel(
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
      this.addressModel,
      this.footServiceModel,
      this.paymentId = "",
      this.cancelledByUid = "",
      this.appointmentType = DoctorAppointmentType.consultYourDoctor});

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
      "addressModel": addressModel != null ? addressModel!.toMap() : {},
      "footServiceModel":
          footServiceModel != null ? footServiceModel!.toJson() : {},
      "paymentId": paymentId,
      "appointmentDate": appointmentDate,
      "appointmentTime": appointmentTime,
      "appointmentType": appointmentType.index,
      "cancelledByUid": cancelledByUid
    };
  }

  // Create model from Firestore document snapshot
  factory FootServiceAppointmentModel.fromSnapshot(Map data) {
    return FootServiceAppointmentModel(
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
        addressModel: data["addressModel"] != null
            ? AddressModel.fromMap(data["addressModel"])
            : null,
        footServiceModel: data["footServiceModel"] != null
            ? FootServiceModel.fromJson(data["footServiceModel"])
            : null,
        appointmentTime: data["appointmentTime"] ?? "",
        appointmentDate: data["appointmentDate"] ?? "",
        modifiedAt: data['modifiedAt'],
        paymentId: data["paymentId"] ?? "",
        cancelledByUid: data["cancelledByUid"] ?? "",
        appointmentType: data['appointmentType'] != null
            ? DoctorAppointmentType.values[data['appointmentType']]
            : DoctorAppointmentType.consultYourDoctor);
  }
}
