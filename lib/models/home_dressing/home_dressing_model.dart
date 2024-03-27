import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class HomeDressingModel {
  String image;
  String docId;
  String uId;
  double newPrice;
  double oldPrice;
  String title;
  String description;
  String textDescription;

  HomeDressingModel({
    this.image = "",
    this.title = "",
    this.description = "",
    this.docId = "",
    this.uId = "",
    this.newPrice = 0.0,
    this.oldPrice = 0.0,
    this.textDescription = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'docId': docId,
      'uId': uId,
      'title': title,
      'description': description,
      'newPrice': newPrice,
      'oldPrice': oldPrice,
      'textDescription': textDescription,
    };
  }

  factory HomeDressingModel.fromJson(Map map) {
    return HomeDressingModel(
      image: map['image'] ?? "",
      docId: map['docId'] ?? "",
      uId: map['uId'] ?? "",
      title: map['title'] ?? "",
      newPrice: (map['newPrice'] ?? 0).toDouble(),
      oldPrice: (map['oldPrice'] ?? 0).toDouble(),
      description: map['description'] ?? "",
      textDescription: map['textDescription'] ?? "",
    );
  }
}
// List<HomeDressingModel> homeDressingServicesList = [
//   HomeDressingModel(
//       image: AssetsConstants.wounded_foot,
//       title: Strings.small,
//       description: Strings.home_dressing_description,
//       id: 1,
//       newPrice: 800,
//       oldPrice: 0,
//       textDescription: "1 Day"),
//   HomeDressingModel(
//       image: AssetsConstants.wounded_foot,
//       title: Strings.medium,
//       description: Strings.home_dressing_description,
//       id: 2,
//       newPrice: 1360,
//       oldPrice: 1600,
//       textDescription: "2 Day"),
//   HomeDressingModel(
//       image: AssetsConstants.wounded_foot,
//       title: Strings.small,
//       description: Strings.home_dressing_description,
//       id: 3,
//       newPrice: 2800,
//       oldPrice: 4000,
//       textDescription: "5 Day"),
// ];
