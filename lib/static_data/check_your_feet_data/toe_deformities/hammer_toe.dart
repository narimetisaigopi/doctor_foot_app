import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class HammerToe {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.hammer_toe_full_image,
    title: "Hammer Toe",
    averageRating: 4.4,
    reviewCount: 320,
    subTitle: "Corner of the nail digs \ninto the skin of the toe",
    actualPrice: 399,
    offerPrice: 499,
    about:
        """A hammer toe is a deformity of the second, third or fourth toes. In this condition, the toe is bent at the middle joint, so that it resembles a hammer. Initially, hammer toes are flexible and can be corrected with simple measures but, if left untreated, they can become fixed and require surgery.\n 
       Hammer toe is the result of a muscle imbalance that puts pressure on the toe tendons and joints.\n
    Wearing shoes that do not fit properly is a common cause of this imbalance. Shoes that narrow toward the toe push the smaller toes into a flexed (bent) position. The toes rub against the shoe, leading to the formation of corns and calluses, which further aggravate the condition. Shoes with a higher heel force the foot down and push the toes against the shoe, increasing the pressure and the bend in the toe. Eventually, the toe muscles can no longer straighten the toe. \n
  
""",
    isPriceing: true,
  );
}
