import 'package:drfootapp/models/foot_service_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/enums.dart';

class DressingAtHomeLarge {
  static FootServiceDetailModel nurseServiceDetailModel =
      FootServiceDetailModel(
    title: "Dressing At Home :",
    description:
        "Dressing at home is a services where we provide our user to remedy themselves at home by following the instructions & information provided by experts.  ",
    image: AssetsConstants.dressing_at_home_image,
    nurseServiceModelList: [
      FootServiceModel(
        image: AssetsConstants.large_image,
        dayRemain: "1 Day",
        docId: "c3f65b2c-a851-48e7-b2f1-8ce8cc99cce9",
        footServiceType: FootServiceType.dressingAtHomeLarge,
        title: "Large",
        description: "If your wound is <500cm ,\n Then it is recommended.",
        offerPrice: 1500,
        actualPrice: 1500,
        reviewCount: 320,
        averageRating: 4.5,
      ),
      FootServiceModel(
        image: AssetsConstants.large_image,
        dayRemain: "5 Day",
        title: "Large",
        docId: "d25c2d4d-2ddf-4ee5-a1a5-51680940610b",
        footServiceType: FootServiceType.dressingAtHomeLarge,
        description: "If your wound is <500cm ,\n Then it is recommended.",
        offerPrice: 2550,
        actualPrice: 3000,
        reviewCount: 134,
        averageRating: 4.5,
      ),
      FootServiceModel(
        image: AssetsConstants.large_image,
        dayRemain: "2 Day",
        title: "Large",
        docId: "c3f65b2c-a851-48e7-b2f1-8ce8cc99cce9",
        footServiceType: FootServiceType.dressingAtHomeLarge,
        description: "If your wound is <500cm ,\n Then it is recommended.",
        offerPrice: 1360,
        actualPrice: 5250,
        reviewCount: 7500,
        averageRating: 4.5,
      ),
    ],
  );
}
