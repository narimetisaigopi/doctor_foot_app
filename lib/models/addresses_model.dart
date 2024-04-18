class AddressesModel {
  String uid = "";
  String docId = "";
  String houseNo = "";
  String state = "";
  String area = "";
  String landMark = "";
  String addressLabel = "";
  dynamic timestamp;
  bool selectedAddresses;

  AddressesModel({
    this.uid = "",
    this.selectedAddresses = false,
    this.docId = "",
    this.houseNo = "",
    this.state = "",
    this.area = "",
    this.timestamp,
    this.landMark = "",
    this.addressLabel = "",
  });

  factory AddressesModel.fromMap(Map<String, dynamic> map) {
    return AddressesModel(
      houseNo: map["houseNo"] ?? "",
      timestamp: map["timestamp"] ?? "",
      state: map["state"] ?? "",
      uid: map["uid"] ?? "",
      docId: map["docId"] ?? "",
      selectedAddresses: map["selectedAddresses"] ?? false,
      area: map["area"] ?? "",
      landMark: map["landMark"] ?? "",
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
    };
  }
}
