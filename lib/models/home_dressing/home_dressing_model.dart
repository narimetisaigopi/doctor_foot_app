import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';

class HomeDressingModel {
  String image;
  double id;
  double newPrice;
  double oldPrice;
  String title;
  String description;
  String textDescription;

  HomeDressingModel({
    this.image = "",
    this.title = "",
    this.description = "",
    this.id = 0,
    this.newPrice = 0.0,
    this.oldPrice = 0.0,
    this.textDescription = "",
  });
}

List<HomeDressingModel> homeDressingServicesList = [
  HomeDressingModel(
      image: AssetsConstants.wounded_foot,
      title: Strings.small,
      description: Strings.home_dressing_description,
      id: 1,
      newPrice: 800,
      oldPrice: 0,
      textDescription: "1 Day"),
  HomeDressingModel(
      image: AssetsConstants.wounded_foot,
      title: Strings.medium,
      description: Strings.home_dressing_description,
      id: 2,
      newPrice: 1360,
      oldPrice: 1600,
      textDescription: "2 Day"),
  HomeDressingModel(
      image: AssetsConstants.wounded_foot,
      title: Strings.small,
      description: Strings.home_dressing_description,
      id: 3,
      newPrice: 2800,
      oldPrice: 4000,
      textDescription: "5 Day"),
];
