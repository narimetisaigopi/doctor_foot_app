import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class IngrownToeNails {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.ingrow_toe_nail_full_image,
    title: "Ingrown Toe Nails",
    averageRating: 4.5,
    reviewCount: 320,
    subTitle: "Corner of the nail digs \ninto the skin of the toe",
     actualPrice: 499,
    offerPrice: 399,
    about:
        """An ingrown toenail occurs when the side or corner of the nail digs into the skin of the toe. This happens mostly to the big toenail, but it can happen to any toenail.
    CAUSES:
    ● Wearing shoes that do not fit well.
    ● Incorrectly cutting your toenails is another main cause. Toenails that are peeled off at the edge or trimmed down at the corners are more likely to become ingrown.
    ● An injury to your toe also can cause an ingrown toenail.
    ● People who have deformed or misshaped toenails have a higher risk of ingrown toenails.
    To avoid ingrown toenails, cut your nails straight across. The top of your nail should make a straight line. Do not pick at your nails or tear them at the corners. Wear shoes that fit correctly and allow plenty of room for your toes. Avoid high heels and tight-fitting shoes.
""",
    isPriceing: true,
  );
}
