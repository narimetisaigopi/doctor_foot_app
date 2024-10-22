import 'package:drfootapp/utils/enums.dart';
class DietChartModel {
  String docId;
  List weeksList;
  String slotTitle;
  String image;
  String description;
  bool isActive;
  dynamic timestamp;
  DietType dietType; // veg,non-veg,
  bool isDiaryProduct;
  List ingredientsList;
  DietChartModel(
      {this.docId = "",
      this.weeksList = const [],
      this.slotTitle = "",
      this.image = "",
      this.isActive = true,
      this.isDiaryProduct = false,
      this.timestamp = "",
      this.dietType = DietType.veg,
      this.description = "",
      this.ingredientsList = const []});

  factory DietChartModel.fromJson(Map<String, dynamic> map) {
    return DietChartModel(
        docId: map["docId"] ?? "",
        weeksList: map["weeksList"] ?? "",
        slotTitle: map["slotTitle"] ?? "",
        image: map["image"] ?? "",
        isActive: map["isActive"] ?? true,
        isDiaryProduct: map["isDiaryProduct"] ?? true,
        timestamp: map["timestamp"] ?? "",
        description: map["description"] ?? "",
        dietType: map['dietType'] != null
            ? DietType.values[map['dietType']]
            : DietType.veg,
        ingredientsList: map["ingredientsList"] ?? []);
  }

  Map<String, dynamic> toMap() {
    return {
      "docId": docId,
      "weeksList": weeksList,
      "slotTitle": slotTitle,
      "image": image,
      "isActive": isActive,
      "timestamp": DateTime.now(),
      "description": description,
      "dietType": dietType.index,
      "isDiaryProduct": isDiaryProduct,
      "ingredientsList": ingredientsList
    };
  }
}
