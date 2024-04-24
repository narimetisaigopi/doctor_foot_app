class AddressModel {
  String uid = "";
  String docId = "";
  String houseNo = "";
  String state = "";
  String area = "";
  String landMark = "";
  String addressLabel = "";
  String alternativeMobileNumber = "";
  String pincode = "";
  dynamic timestamp;
  bool selectedAddresses;

  AddressModel({
    this.uid = "",
    this.selectedAddresses = false,
    this.docId = "",
    this.houseNo = "",
    this.state = "",
    this.area = "",
    this.timestamp,
    this.landMark = "",
    this.addressLabel = "",
    this.alternativeMobileNumber = "",
    this.pincode = "",
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      houseNo: map["houseNo"] ?? "",
      timestamp: map["timestamp"] ?? "",
      state: map["state"] ?? "",
      uid: map["uid"] ?? "",
      docId: map["docId"] ?? "",
      selectedAddresses: map["selectedAddresses"] ?? false,
      area: map["area"] ?? "",
      landMark: map["landMark"] ?? "",
      pincode: map["pincode"] ?? "",
      alternativeMobileNumber: map["alternativeMobileNumber"] ?? "",
      addressLabel: map["addressLabel"] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "houseNo": houseNo,
      "timestamp": timestamp,
      "selectedAddresses": selectedAddresses,
      "uid": uid,
      "docId": docId,
      "state": state,
      "area": area,
      "landMark": landMark,
      "addressLabel": addressLabel,
      "pincode": pincode,
      "alternativeMobileNumber": alternativeMobileNumber,
    };
  }

  getAddress() {
    return "House No:$houseNo,\n$area - $pincode";
  }
}
