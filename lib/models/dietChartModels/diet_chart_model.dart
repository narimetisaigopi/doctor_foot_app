import 'package:drfootapp/utils/enums.dart';

class DietChartModel {
  String docId;
  String week;
  String slotTitle;
  String slotTiming;
  String dietImage;
  String dietDescription;
  bool isActive;
  dynamic timestamp;
  DietType dietType; // veg,non-veg,
  bool isDiaryProduct;
  List ingredientsList;
  DietChartModel(
      {this.docId = "",
      this.week = "",
      this.slotTitle = "",
      this.slotTiming = "",
      this.dietImage = "",
      this.isActive = true,
      this.isDiaryProduct = false,
      this.timestamp = "",
      this.dietType = DietType.veg,
      this.dietDescription = "",
      this.ingredientsList = const []});

  factory DietChartModel.fromJson(Map<String, dynamic> map) {
    return DietChartModel(
        docId: map["docId"] ?? "",
        week: map["week"] ?? "",
        slotTitle: map["slotTitle"] ?? "",
        slotTiming: map["slotTiming"] ?? "",
        dietImage: map["dietImage"] ?? "",
        isActive: map["isActive"] ?? true,
        isDiaryProduct: map["isDiaryProduct"] ?? true,
        timestamp: map["timestamp"] ?? "",
        dietDescription: map["dietDescription"] ?? "",
        dietType: map['dietType'] != null
            ? DietType.values[map['dietType']]
            : DietType.veg,
        ingredientsList: map["ingredientsList"] ?? []);
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
      "dietType": dietType.index,
      "isDiaryProduct": isDiaryProduct,
      "ingredientsList": ingredientsList
    };
  }
}
