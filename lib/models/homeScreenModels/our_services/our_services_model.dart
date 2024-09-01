import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class OurServicesModel {
  late String image;
  late String serviceNames;

 OurServicesModel({this.image = "", this.serviceNames = ""});
}

List<OurServicesModel> OurservicesList = [
 OurServicesModel(
      // image: AssetsConstants.foot, 
      // serviceNames: Strings.haveulcerText
      image: AssetsConstants.dr_consult, 
      serviceNames: Strings.consultyourdoctorText
      ),
      OurServicesModel(
image: AssetsConstants.well_kept_nails,
serviceNames: Strings.onlineConsultationText
      ),
  // OurServicesModel(
  //     image: AssetsConstants.speedometer,
  //     serviceNames: Strings.riskcheckerText),
  OurServicesModel(
      image: AssetsConstants.checkup_shedule,
      serviceNames: Strings.footscreeningservicesText),
  OurServicesModel(
      image: AssetsConstants.foot_service,
      serviceNames: Strings.dressingAtText),
     OurServicesModel(
      image: AssetsConstants.wounded_foot ,
      serviceNames: Strings.footCleansingText),
       OurServicesModel(
      image: AssetsConstants.foot_service,
      serviceNames: Strings.nailTrimmingText),
      OurServicesModel(
      image: AssetsConstants.dr_consult,
      serviceNames: Strings.footwearText),
      OurServicesModel(
      image: AssetsConstants.dr_consult,
      serviceNames: Strings.footProductsText),
      
];
