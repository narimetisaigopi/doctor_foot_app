import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/utils/enums.dart';

class AppointmentModel {
  String docId;
  String uid;
  int amount;
  int appointmentId;
  Timestamp? appointmentTimestamp;
  AppointmentStatus appointmentStatus;
  Timestamp? timestamp;
  Timestamp? lastUpdate;

  AppointmentModel({
    this.docId = "",
    this.uid = "",
    this.amount = 0,
    this.appointmentId = 0,
    this.appointmentStatus = AppointmentStatus.none,
    this.timestamp,
    this.lastUpdate,
  });

  // Convert model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'uid': uid,
      'amount': amount,
      'appointmentStatus': appointmentStatus.index, // Store enum as index
      'timestamp': timestamp,
      'lastUpdate': lastUpdate,
      'appointmentId': appointmentId
    };
  }

  // Create model from Firestore document snapshot
  factory AppointmentModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return AppointmentModel(
      docId: data['docId'] ?? "",
      uid: data['uid'] ?? "",
      amount: data['amount'] ?? 0,
      appointmentId: data["appointmentId"] ?? 0,
      appointmentStatus: data['appointmentStatus'] != null
          ? AppointmentStatus.values[data['appointmentStatus']]
          : AppointmentStatus.none, // Retrieve enum from index
      timestamp: data['timestamp'],
      lastUpdate: data['lastUpdate'],
    );
  }
}
