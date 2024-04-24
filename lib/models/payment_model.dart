import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/utils/enums.dart';

class PaymentModel {
  String docId;
  String uid;
  String gatewayTransactionId;
  String message;
  String subscriptionId;
  double amount;
  int paymentId;
  PaymentStatus paymentStatus;
  PaymentServiceType paymentServiceType;
  Timestamp? timestamp;
  Timestamp? lastUpdate;

  PaymentModel({
    this.docId = "",
    this.uid = "",
    this.subscriptionId = "",
    this.gatewayTransactionId = "",
    this.amount = 0,
    this.message = "",
    this.paymentId = 0,
    this.paymentStatus = PaymentStatus.none,
    this.paymentServiceType = PaymentServiceType.none,
    this.timestamp,
    this.lastUpdate,
  });

  // Convert model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'subscriptionId': subscriptionId,
      'amount': amount,
      'uid': uid,
      'paymentId': paymentId,
      'gatewayTransactionId': gatewayTransactionId,
      'message': message,
      'paymentStatus': paymentStatus.index,
      'paymentServiceType': paymentServiceType.index,
      'timestamp': timestamp,
      'lastUpdate': lastUpdate,
    };
  }

  // Create model from Firestore document snapshot
  factory PaymentModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return PaymentModel(
      docId: data["docId"] ?? "",
      uid: data["uid"] ?? "",
      paymentId: data["paymentId"] ?? 0,
      message: data["message"] ?? "",
      gatewayTransactionId: data["gatewayTransactionId"] ?? "",
      subscriptionId: data['subscriptionId'],
      amount: data['amount'],
      paymentStatus: data['paymentStatus'] != null
          ? PaymentStatus.values[data['paymentStatus']]
          : PaymentStatus.none, // Retrieve enum from index
      paymentServiceType: data['paymentServiceType'] != null
          ? PaymentServiceType.values[data['paymentServiceType']]
          : PaymentServiceType.none, // Retrieve enum from index
      timestamp: data['timestamp'],
      lastUpdate: data['lastUpdate'],
    );
  }
}
