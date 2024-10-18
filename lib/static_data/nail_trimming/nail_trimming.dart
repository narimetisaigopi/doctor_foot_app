import 'package:drfootapp/screens/foot_services/model/nurse_service_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class NailTrimming {
  static NurseServiceDetailModel nurseServiceDetailModel =
      NurseServiceDetailModel(
    title: "Dressing At Home :",
    description:
        "Dressing at home is a services where we provide our user to remedy themselves at home by following the instructions & information provided by experts.  ",
    image: AssetsConstants.nail_trimming_detail_image,
    nurseServiceModelList: [
      NurseServiceModel(
        image: AssetsConstants.nail_single_foot,
        dayRemain: "",
        title: "Single Foot",
        description: "Foot and legs cleaning \n& Nail trimming",
        offerPrice: 899,
        actualPrice: 999,
        reviewCount: 320,
        averageRating: 4.5,
      ),
      NurseServiceModel(
        image: AssetsConstants.nail_both_foots,
        dayRemain: "",
        title: "Both Foot",
        description: "Foot and legs cleaning \n& Nail trimming",
        offerPrice: 899,
        actualPrice: 999,
        reviewCount: 320,
        averageRating: 4.5,
      ),
    ],
  );
}
