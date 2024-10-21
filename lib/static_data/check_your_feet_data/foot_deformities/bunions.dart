import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class Bunions {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.bunioun_full_image,
    title: "Bunions",
    averageRating: 4.4,
    reviewCount: 320,
    subTitle: "Corner of the nail digs \ninto the skin of the toe",
    actualPrice: 499,
    offerPrice: 399,
    about:
        """A bunion (also referred to as hallux valgus) is often described as a bump on the side of the big toe. But a bunion is more than that. The visible bump actually reflects changes in the bony framework of the front part of the foot. The big toe leans toward the second toe, rather than pointing straight ahead. This throws the bones out of alignment—producing the bunion’s bump. 
        Bunions are a progressive disorder. They begin with a leaning of the big toe, gradually changing the angle of the bones over the years and slowly producing the characteristic bump, which becomes increasingly prominent. Symptoms usually appear at later stages, although some people never have symptoms.
        Symptoms, which occur at the site of the bunion, may include:
        ● Pain or soreness
        ● Inflammation and redness
        ● A burning sensation
        ● Possible numbness
""",
    isPriceing: true,
  );
}
