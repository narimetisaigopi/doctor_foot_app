import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class SkinAndNailModel {
  String image;
  String serviceNames;

  SkinAndNailModel({this.image = "", this.serviceNames = ""});
}

List<SkinAndNailModel> skinAndNailList = [
  SkinAndNailModel(
      image: AssetsConstants.ingrow_toe_nail,
      serviceNames: Strings.ingrownToeNailText),
  SkinAndNailModel(
      image: AssetsConstants.corns_image, serviceNames: Strings.cornsText),
  SkinAndNailModel(
      image: AssetsConstants.planter_warts,
      serviceNames: Strings.plantarWartsText),
  SkinAndNailModel(
    image: AssetsConstants.toe_nail_fungus,
    serviceNames: Strings.toeNailFungusText,
  ),
  SkinAndNailModel(
    image: AssetsConstants.foliquilities,
    serviceNames: Strings.folliculitisText,
  ),
];
