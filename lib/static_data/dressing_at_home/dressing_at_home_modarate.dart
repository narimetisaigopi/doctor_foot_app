import 'package:drfootapp/models/nurse_service_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class DressingAtHomeModearte {
  static NurseServiceDetailModel nurseServiceDetailModel =
      NurseServiceDetailModel(
    title: "Dressing At Home :",
    description:
        "Dressing at home is a services where we provide our user to remedy themselves at home by following the instructions & information provided by experts.  ",
    image: AssetsConstants.dressing_at_home_image,
    nurseServiceModelList: [
      NurseServiceModel(
        image: AssetsConstants.moderate,
        dayRemain: "1 Day",
        title: "Moderate",
        description: "If your wound is <100cm ,\n Then it is recommended.",
        offerPrice: 1000,
        actualPrice: 800,
        reviewCount: 320,
        averageRating: 4.5,
      ),
      NurseServiceModel(
        image: AssetsConstants.moderate,
        dayRemain: "5 Day",
        title: "Moderate",
        description: "If your wound is <100cm ,\n Then it is recommended.",
        offerPrice: 1700,
        actualPrice: 2000,
        reviewCount: 134,
        averageRating: 4.5,
      ),
      NurseServiceModel(
        image: AssetsConstants.moderate,
        dayRemain: "2 Day",
        title: "Moderate",
        description: "If your wound is <100cm ,\n Then it is recommended.",
        offerPrice: 1360,
        actualPrice: 3500,
        reviewCount: 5000,
        averageRating: 4.5,
      ),
    ],
  );
}
