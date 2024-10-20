import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class SportsInjuries {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.sports_injuries,
    title: "Sports Injuries",
    averageRating: 4.4,
    reviewCount: 320,
    subTitle: "Corner of the nail digs \ninto the skin of the toe",
    actualPrice: 399,
    offerPrice: 499,
    about:
        """An injury brought on by the ankle rolling, twisting, or turning awkwardly.  \n 
        The strong tissue bands (ligaments) that support the stability of the ankle bones may be torn or stretched as a result.\n
        Ankle sprains result in pain, edema, and restricted range of motion. Many people just use rest, ice, and painkillers to manage a sprained ankle at home. Severe sprains might require a check-up from a doctor. \n
      Symptoms\n
     ● Pain: Usually sudden and severe, felt on the outside or inside of the ankle depending on the affected ligaments.\n
● Swelling: Rapid swelling around the ankle joint.\n
● Bruising: Discoloration or bruising around the ankle area due to bleeding under the skin.\n
● Instability: Difficulty bearing weight on the affected ankle, with a feeling of weakness or instability.
Contact our physicians for more information


""",
    isPriceing: true,
  );
}
