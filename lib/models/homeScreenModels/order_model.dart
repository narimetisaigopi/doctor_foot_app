import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/address_model.dart';
import 'package:drfootapp/utils/enums.dart';

class OrderModel {
  String docId;
  List<String> items;
  int quantity;
  double amount;
  double discount;
  int orderId;
  String uid;
  OrderStatus orderStatus;
  String couponCodeId;
  String paymentId;
  Timestamp? timestamp;
  Timestamp? lastUpdate;
  AddressModel? address;

  OrderModel(
      {this.uid = "",
      this.quantity = 0,
      this.amount = 0,
      this.discount = 0,
      this.orderId = 0,
      this.docId = "",
      this.paymentId = "",
      this.couponCodeId = "",
      this.timestamp,
      this.lastUpdate,
      this.address,
      this.items = const [],
      this.orderStatus = OrderStatus.none});

  // Create model from Firestore document snapshot
  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
        docId: data["docId"] ?? "",
        uid: data["uid"] ?? "",
        quantity: data["quantity"] ?? 0,
        amount: data["amount"] ?? 0,
        discount: data["discount"] ?? 0,
        orderId: data["orderId"] ?? 0,
        paymentId: data["paymentId"] ?? "",
        orderStatus: data['orderStatus'] != null
            ? OrderStatus.values[data['orderStatus']]
            : OrderStatus.none, // Retrieve enum from index
        timestamp: data['timestamp'],
        items: data["items"] ?? [],
        lastUpdate: data['lastUpdate'],
        address: AddressModel.fromMap(data['address']));
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "quantity": quantity,
      "amount": amount,
      "orderId": orderId,
      "discount": discount,
      "docId": docId,
      "paymentId": paymentId,
      "couponCodeId": couponCodeId,
      "orderStatus": orderStatus,
      "timestamp": timestamp,
      "lastUpdate": lastUpdate,
      "items": items,
      "address": address != null ? address!.toMap() : {},
    };
  }
}
