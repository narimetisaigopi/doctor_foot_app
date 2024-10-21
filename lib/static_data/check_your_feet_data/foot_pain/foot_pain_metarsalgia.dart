import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class FootPainMetarsalgia {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.metatarsalgia,
    title: "Metatarsalgia",
    about:
        """Pain and inflammation around the ball of the foot, specifically around the metatarsal bones, is referred to as metatarsalgia. These are the lengthy bones in the middle of the foot that connect the toes to the ankle. Metatarsalgia is a prevalent illness that affects people of all ages. 
           Factors that can cause excessive pressure are:
           ● Participating in high impact activities without proper footwear and/or orthotics
           ● Older age as the pad in the foot tends to thin out making it much more susceptible pressure and pain
           ● An imbalance in the length of the metatarsals
           ● Majority seem to be related to foot and ankle deformity
           ● Disturbances in gait
           ● Morphology of the foot (e.g. increased bone length that protrudes into the bottom of the foot)
           ● A shortened Achilles tendon  
""",
    isPriceing: true,
  );
}
