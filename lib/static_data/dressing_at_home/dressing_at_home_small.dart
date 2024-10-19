import 'package:drfootapp/models/foot_service_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/enums.dart';

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
        docId: "2eda4bc5-7f10-4d3e-bb56-9ac1423e67d3",
        footServiceType: FootServiceType.dressingAtHomeSmall,
        description: "If your wound is <25cm ,\n Then it is recommended.",
        offerPrice: 1000,
        actualPrice: 800,
        reviewCount: 320,
        averageRating: 4.5,
      ),
      FootServiceModel(
        image: AssetsConstants.small,
        dayRemain: "2 Day",
        docId: "8dca9ef3-5c80-441f-bf36-8bd9442f12c4",
        footServiceType: FootServiceType.dressingAtHomeSmall,
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
        docId: "3fba6cd1-9b60-452e-ae25-7ec7321d89a1",
        footServiceType: FootServiceType.dressingAtHomeSmall,
        description: "If your wound is <25cm ,\n Then it is recommended.",
        offerPrice: 2800,
        actualPrice: 4000,
        reviewCount: 134,
        averageRating: 4.5,
      ),
      
    ],
  );
}
