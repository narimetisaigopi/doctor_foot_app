// ignore_for_file: prefer_typing_uninitialized_variables

class CouponCodeModel {
  String couponCode;
  List uids;
  int maxDiscount;
  String docId;
  String description;
  var expireDate;
  bool isExpired;

  CouponCodeModel({
    this.couponCode = "",
    this.description = "",
    this.docId = "",
    this.maxDiscount = 0,
    this.isExpired = false,
    this.expireDate,
    this.uids = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'couponCode': couponCode,
      'description': description,
      'docId': docId,
      'uids': uids,
      'maxDiscount': maxDiscount,
      'expireDate': expireDate,
      'isExpired': isExpired,
    };
  }

  factory CouponCodeModel.fromJson(dynamic map) {
    return CouponCodeModel(
        couponCode: map['couponCode'] ?? "",
        docId: map['docId'] ?? "",
        uids: map['uids'] ?? [],
        maxDiscount: map['maxDiscount'] ?? 0,
        expireDate: map['expireDate'] ?? '',
        isExpired: map['isExpired'] ?? '');
  }
}
