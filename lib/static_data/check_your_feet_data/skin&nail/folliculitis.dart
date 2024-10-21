import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class Folliculitis {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.folli_full_image,
    title: "Folliculitis",
    averageRating: 4.4,
    reviewCount: 320,
    subTitle: "Corner of the nail digs \ninto the skin of the toe",
     actualPrice: 499,
    offerPrice: 399,
    about:
        """Folliculitis is a skin disorder involving the inflammation of hair follicles. It is typically due to an infection and results in irritated pimple-like spots or pustules. Antibiotic or antifungal creams and other therapies can help.
        Folliculitis affectsTrusted Source the hair-bearing areas of the body, often the arms, head, and face. The condition presents small discolored bumps that may have a white, pus-filled tip.
    ● In most cases, folliculitis is a harmless condition. However, it can progress to a more serious disease in people with compromised immune systems.
    ● Staphylococcus aureus is the most common infectious cause of folliculitis.
    ● In most cases, folliculitis will disappear independently.
    ● The most common cause of folliculitis is damage to the hair follicle.
    ● Improper shaving techniques, tight clothing, skin rubbing, and some medications can all cause follicle damage.
""",
    isPriceing: true,
  );
}
