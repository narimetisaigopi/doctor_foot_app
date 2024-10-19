import 'package:drfootapp/models/foot_service_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/enums.dart';

class DressingAtHomeHuge {
  static FootServiceDetailModel nurseServiceDetailModel =
      FootServiceDetailModel(
    title: "Dressing At Home :",
    description:
        "Dressing at home is a services where we provide our user to remedy themselves at home by following the instructions & information provided by experts.  ",
    image: AssetsConstants.dressing_at_home_image,
    nurseServiceModelList: [
      FootServiceModel(
        image: AssetsConstants.huge_image,
        dayRemain: "1 Day",
        docId: "d8c3ffcb-d453-47a0-bfd4-38b3607ab18b",
        footServiceType: FootServiceType.dressingAtHomeHuge,
        title: "Huge",
        description: "If your wound is <1000cm ,\n Then it is recommended.",
        offerPrice: 2000,
        actualPrice: 2000,
        reviewCount: 320,
        averageRating: 4.5,
      ),
      FootServiceModel(
        image: AssetsConstants.huge_image,
        docId: "7620c85c-b38b-429c-b63f-1900744f1021",
        footServiceType: FootServiceType.dressingAtHomeHuge,
        dayRemain: "5 Day",
        title: "Huge",
        description: "If your wound is <1000cm ,\n Then it is recommended.",
        offerPrice: 3400,
        actualPrice: 4000,
        reviewCount: 134,
        averageRating: 4.5,
      ),
      FootServiceModel(
        image: AssetsConstants.huge_image,
        dayRemain: "2 Day",
        docId: "d8c3ffcb-d453-47a0-bfd4-38b3607ab18b",
        footServiceType: FootServiceType.dressingAtHomeHuge,
        title: "Huge",
        description: "If your wound is <1000cm ,\n Then it is recommended.",
        offerPrice: 1360,
        actualPrice: 7000,
        reviewCount: 10000,
        averageRating: 4.5,
      ),
    ],
  );
}
