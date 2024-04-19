class DietChartModel {
  String docId;
  String week;
  String slotTitle;
  String slotTiming;
  String dietImage;
  String dietDescription;
  bool isActive;
  dynamic timestamp;
  String dietType; // veg,non-veg,
  DietChartModel(
      {this.docId = "",
      this.week = "",
      this.slotTitle = "",
      this.slotTiming = "",
      this.dietImage = "",
      this.isActive = true,
      this.timestamp = "",
      this.dietType = "",
      this.dietDescription = ""});

  factory DietChartModel.fromJson(Map<String, dynamic> map) {
    return DietChartModel(
        docId: map["docId"] ?? "",
        week: map["week"] ?? "",
        slotTitle: map["slotTitle"] ?? "",
        slotTiming: map["slotTiming"] ?? "",
        dietImage: map["dietImage"] ?? "",
        isActive: map["isActive"] ?? true,
        timestamp: map["timestamp"] ?? "",
        dietType: map["dietType"] ?? "",
        dietDescription: map["dietDescription"] ?? "");
  }

  Map<String, dynamic> toMap() {
    return {
      "docId": docId,
      "week": week,
      "slotTitle": slotTitle,
      "slotTiming": slotTiming,
      "dietImage": dietImage,
      "isActive": isActive,
      "timestamp": DateTime.now(),
      "dietDescription": dietDescription,
      "dietType": dietType
    };
  }
}
