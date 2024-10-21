import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class CharcotFoot {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.bunioun_full_image,
    title: "Charcot Foot",
    averageRating: 4.4,
    reviewCount: 320,
    subTitle: "Corner of the nail digs \ninto the skin of the toe",
    actualPrice: 499,
    offerPrice: 399,
    about:
        """Charcot foot can result from complete or near-complete numbness in one or both feet or ankles. This condition causes the bones in the foot to become weak, making them prone to damage such as fractures and dislocation.  
        Because the foot is numb, pain from fractures or other traumas can go unnoticed, leading to additional damage from walking and standing.
        As the bones continue to weaken, the joints of the foot can become dislocated or collapse, changing the foot’s shape. The resulting shape is referred to as rocker-bottom foot, since the arch extends down and out, creating a rocker-like appearance. 
        Charcot foot can also lead to the occurrence of sores, which are hard to heal. If left untreated, Charcot foot can lead to severe deformity, disability, or amputation.
        Charcot foot is most closely associated as a rare complication of diabetes, but peripheral neuropathy is associated with several conditions. 
        These include:
         ● diabetes
         ● alcohol use disorder
         ● drug abuse
         ● Hansen’s disease (leprosy)
         ● syphilis
         ● syringomyelia
         ● polio
         ● infection, trauma, or damage in the peripheral nerves
         ● HIV
         ● Parkinson’s disease
         ● inflammatory conditions, such as sarcoidosis or psoriasis 

""",
    isPriceing: true,
  );
}
