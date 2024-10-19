import 'package:drfootapp/models/foot_service_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/enums.dart';

class FootCleansing {
  static FootServiceDetailModel nurseServiceDetailModel =
      FootServiceDetailModel(
    title: "Dressing At Home :",
    description:
        "Dressing at home is a services where we provide our user to remedy themselves at home by following the instructions & information provided by experts.  ",
    image: AssetsConstants.dressing_at_home_image,
    nurseServiceModelList: [
      FootServiceModel(
        image: AssetsConstants.single_foot,
        dayRemain: "",
        docId: "c5b49f27-e1d5-4f1b-a4f2-08e69f72f1c5",
        footServiceType: FootServiceType.footCleaning,
        title: "Single Foot",
        description: "Foot and legs cleaning \n& Nail trimming",
        offerPrice: 899,
        actualPrice: 999,
        reviewCount: 320,
        averageRating: 4.5,
      ),
      FootServiceModel(
        image: AssetsConstants.both_foot,
        dayRemain: "",
        title: "Both Foot",
        docId: "a3e96d3a-d8c7-45b3-bd18-3d9b58b9e8b2",
        footServiceType: FootServiceType.footCleaning,
        description: "Foot and legs cleaning \n& Nail trimming",
        offerPrice: 1299,
        actualPrice: 1499,
        reviewCount: 320,
        averageRating: 4.5,
      ),
      
      
    ],
  );
}
