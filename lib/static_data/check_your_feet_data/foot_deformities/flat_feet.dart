import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class FlatFeet {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.flat_feet_full_image,
    title: "Flat Feet",
    averageRating: 4.4,
    reviewCount: 320,
    subTitle: "Corner of the nail digs \ninto the skin of the toe",
    actualPrice: 399,
    offerPrice: 499,
    about:
        """Flat feet, also called pes planus, is a deformity that occurs when the arch of the foot collapses and comes into complete or near-complete contact with the ground. The condition may be congenital (occurring at the time of birth) or acquired (developing over time, most often as a result of age or injury). Most flat feet do not cause pain or other problems.\n 
        Children don't often have foot pain, ankle pain, or lower leg pain. They should be evaluated by a health care provider if this occurs.\n
        Symptoms in adults may include tired or achy feet after long periods of standing or playing sports. You also may have pain on the outside of the ankle.\n
        For patients that have had flat foot for a long time, you may develop changes in the appearance and flexibility of your toes also. You can have pain in the deformed toes.
""",
    isPriceing: true,
  );
}
