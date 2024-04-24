import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/utils/enums.dart';

class UlcerMonitoringSubscriptionModel {
  String docId;
  String subscriptionId;
  String uid;
  int amount;
  PaymentStatus paymentStatus;
  Timestamp? timestamp;
  Timestamp? lastUpdate;

  UlcerMonitoringSubscriptionModel({
    this.docId = "",
    this.uid = "",
    this.amount = 0,
    this.subscriptionId = "",
    this.paymentStatus = PaymentStatus.none,
    this.timestamp,
    this.lastUpdate,
  });

  // Convert model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'uid': uid,
      'amount': amount,
      'subscriptionId': subscriptionId,
      'paymentStatus': paymentStatus.index, // Store enum as index
      'timestamp': timestamp,
      'lastUpdate': lastUpdate,
    };
  }

  // Create model from Firestore document snapshot
  factory UlcerMonitoringSubscriptionModel.fromSnapshot(
      DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return UlcerMonitoringSubscriptionModel(
      docId: data['docId'] ?? "",
      uid: data['uid'] ?? "",
      amount: data['amount'] ?? 0,
      subscriptionId: data['subscriptionId'] ?? "",
      paymentStatus: data['paymentStatus'] != null
          ? PaymentStatus.values[data['paymentStatus']]
          : PaymentStatus.none, // Retrieve enum from index
      timestamp: data['timestamp'],
      lastUpdate: data['lastUpdate'],
    );
  }
}
