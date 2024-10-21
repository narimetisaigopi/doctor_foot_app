import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class PlanterWarts {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.planter_warts_full_image,
    title: "Planter Warts",
    averageRating: 4.4,
    reviewCount: 320,
    subTitle: "Corner of the nail digs \ninto the skin of the toe",
   actualPrice: 499,
    offerPrice: 399,
    about:
        """Plantar warts (verruca plantaris) are benign (not harmful) rough bumps that form on the soles of your feet. They develop when the human papillomavirus (HPV) enters a cut or break in your skin and causes an infection.
    Symptoms include:
    ● Rough, thick surface that may look like cauliflower.
    ● Discoloration (dark pink, yellow, brown, purple, or gray)
    ● Dotted with brown or black specks
    ● Pain or tenderness
    ● Discomfort
    ● Bleeding
    Treatments include over-the-counter remedies, salicylic acid, freezing medicine or surgery.
""",
    isPriceing: true,
  );
}
