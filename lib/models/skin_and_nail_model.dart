import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class SkinAndNailModel {
  String image;
  String serviceNames;

  SkinAndNailModel({this.image = "", this.serviceNames = ""});
}

List<SkinAndNailModel> skinAndNailList = [
  SkinAndNailModel(
      image: AssetsConstants.home_dressing_cover_img,
      serviceNames: Strings.ingrownToeNailText),
  SkinAndNailModel(
      image: AssetsConstants.well_kept_nails,
      serviceNames: Strings.cornsText),
  SkinAndNailModel(
      image: AssetsConstants.wounded_foot,
      serviceNames: Strings.plantarWartsText),
  SkinAndNailModel(
      image: AssetsConstants.foot_service, serviceNames: Strings.toeNailFungusText),
  SkinAndNailModel(
      image: AssetsConstants.foot_service,
      serviceNames: Strings.folliculitisText),
];
