import 'package:drfootapp/models/foot_service_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class DressingAtHomeSmall {
  static FootServiceDetailModel nurseServiceDetailModel =
      FootServiceDetailModel(
    title: "Dressing At Home :",
    description:
        "Dressing at home is a services where we provide our user to remedy themselves at home by following the instructions & information provided by experts.  ",
    image: AssetsConstants.dressing_at_home_image,
    nurseServiceModelList: [
      FootServiceModel(
        image: AssetsConstants.small,
        dayRemain: "1 Day",
        title: "Small",
        description: "If your wound is <25cm ,\n Then it is recommended.",
        offerPrice: 1000,
        actualPrice: 800,
        reviewCount: 320,
        averageRating: 4.5,
      ),
      FootServiceModel(
        image: AssetsConstants.small,
        dayRemain: "2 Day",
        title: "Small",
        description: "If your wound is <25cm ,\n Then it is recommended.",
        offerPrice: 1360,
        actualPrice: 1600,
        reviewCount: 320,
        averageRating: 4.5,
      ),
      FootServiceModel(
        image: AssetsConstants.small,
        dayRemain: "5 Day",
        title: "Small",
        description: "If your wound is <25cm ,\n Then it is recommended.",
        offerPrice: 2800,
        actualPrice: 4000,
        reviewCount: 134,
        averageRating: 4.5,
      ),
      
    ],
  );
}
