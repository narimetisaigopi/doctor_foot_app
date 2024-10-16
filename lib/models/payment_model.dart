import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/utils/enums.dart';

class PaymentModel {
  String docId;
  String uid;
  String gatewayTransactionId;
  String message;
  String subscriptionId;
  double totalAmount;
  double paidAmount;
  int paymentId;
  PaymentStatus paymentStatus;
  PaymentServiceType paymentServiceType;
  Timestamp? timestamp;
  Timestamp? modifiedAt;
  PaymentStatus refundStatus;
  Timestamp? refundTimestamp;
  Timestamp? refundModifiedAt;


  PaymentModel({
    this.docId = "",
    this.uid = "",
    this.subscriptionId = "",
    this.gatewayTransactionId = "",
      this.totalAmount = 0,
      this.paidAmount = 0,
    this.message = "",
    this.paymentId = 0,
    this.paymentStatus = PaymentStatus.none,
      this.refundStatus = PaymentStatus.none,
    this.paymentServiceType = PaymentServiceType.none,
    this.timestamp,
      this.modifiedAt,
      this.refundModifiedAt,
      this.refundTimestamp
  });

  // Convert model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'subscriptionId': subscriptionId,
      'totalAmount': totalAmount,
      "paidAmount": paidAmount,
      'uid': uid,
      'paymentId': paymentId,
      'gatewayTransactionId': gatewayTransactionId,
      'message': message,
      'paymentStatus': paymentStatus.index,
      'paymentServiceType': paymentServiceType.index,
      'timestamp': timestamp,
      'modifiedAt': modifiedAt,
      'refundStatus': refundStatus.index,
      'refundModifiedAt': refundModifiedAt,
      'refundTimestamp': refundTimestamp,
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
      totalAmount: double.parse(data['totalAmount'].toString()),
      paidAmount: double.parse(data['paidAmount'].toString()),
      paymentStatus: data['paymentStatus'] != null
          ? PaymentStatus.values[data['paymentStatus']]
          : PaymentStatus.none, 
      paymentServiceType: data['paymentServiceType'] != null
          ? PaymentServiceType.values[data['paymentServiceType']]
          : PaymentServiceType.none, // Retrieve enum from index
      refundStatus: data['refundStatus'] != null
          ? PaymentStatus.values[data['refundStatus']]
          : PaymentStatus.none, // Retrieve enum from index
      timestamp: data['timestamp'],
      modifiedAt: data['modifiedAt'],
      refundModifiedAt: data['refundModifiedAt'],
      refundTimestamp: data['refundTimestamp'],
    );
  }
}
