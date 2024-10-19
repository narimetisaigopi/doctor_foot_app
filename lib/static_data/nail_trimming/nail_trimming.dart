import 'package:drfootapp/models/foot_service_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/enums.dart';

class NailTrimming {
  static FootServiceDetailModel nurseServiceDetailModel =
      FootServiceDetailModel(
    title: "Dressing At Home :",
    description:
        "Dressing at home is a services where we provide our user to remedy themselves at home by following the instructions & information provided by experts.  ",
    image: AssetsConstants.nail_trimming_detail_image,
    nurseServiceModelList: [
      FootServiceModel(
        image: AssetsConstants.nail_single_foot,
        dayRemain: "",
        title: "Single Foot",
        description: "Foot and legs cleaning \n& Nail trimming",
        offerPrice: 899,
        actualPrice: 999,
        reviewCount: 320,
        averageRating: 4.5,
        docId: "9eac23f1-3f58-4ef0-b8a1-ef45e2e5c40e",
        footServiceType: FootServiceType.nailTrimming,
      ),
      FootServiceModel(
        image: AssetsConstants.nail_both_foots,
        dayRemain: "",
        title: "Both Foot",
        docId: "f5c7a1b2-1b32-4c4e-ae1d-57e1b2c3e0e4",
        footServiceType: FootServiceType.nailTrimming,
        description: "Foot and legs cleaning \n& Nail trimming",
        offerPrice: 899,
        actualPrice: 999,
        reviewCount: 320,
        averageRating: 4.5,
      ),
    ],
  );
}
