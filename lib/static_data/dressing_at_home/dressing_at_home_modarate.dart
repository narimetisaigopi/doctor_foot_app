import 'package:drfootapp/models/foot_service_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/enums.dart';

class DressingAtHomeModearte {
  static FootServiceDetailModel nurseServiceDetailModel =
      FootServiceDetailModel(
    title: "Dressing At Home :",
    description:
        "Dressing at home is a services where we provide our user to remedy themselves at home by following the instructions & information provided by experts.  ",
    image: AssetsConstants.dressing_at_home_image,
    nurseServiceModelList: [
      FootServiceModel(
        image: AssetsConstants.moderate,
        dayRemain: "1 Day",
        docId: "757c611b-730a-4164-adc3-57c36659a201",
        footServiceType: FootServiceType.dressingAtHomeModerate,
        title: "Moderate",
        description: "If your wound is <100cm ,\n Then it is recommended.",
        offerPrice: 1000,
        actualPrice: 800,
        reviewCount: 320,
        averageRating: 4.5,
      ),
      FootServiceModel(
        image: AssetsConstants.moderate,
        dayRemain: "5 Day",
        title: "Moderate",
        docId: "86390bb3-a7ca-44f4-b346-9cdda95dbf2f",
        footServiceType: FootServiceType.dressingAtHomeModerate,
        description: "If your wound is <100cm ,\n Then it is recommended.",
        offerPrice: 1700,
        actualPrice: 2000,
        reviewCount: 134,
        averageRating: 4.5,
      ),
      FootServiceModel(
        image: AssetsConstants.moderate,
        dayRemain: "2 Day",
        docId: "7fca7bd2-8a50-414d-ba15-6dc9231c78f0",
        footServiceType: FootServiceType.dressingAtHomeModerate,
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
