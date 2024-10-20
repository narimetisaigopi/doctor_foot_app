import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class Corns {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.corn_full_image,
    title: "Corn",
    averageRating: 4.4,
    reviewCount: 320,
    subTitle: "Corner of the nail digs \ninto the skin of the toe",
    actualPrice: 399,
    offerPrice: 499,
    about:
        """Calluses develop as a normal response to chronic excessive friction and pressure. They are protective pads made up of a thickened upper layer of skin. Corns are small calluses that develop on the top of the toes due to pressure or rubbing against shoes or other toes. Both can be the result of poorly fitting shoes, abnormal foot function, or high activity levels\n 
    CAUSES:\n
    ● Friction and Pressure: Corns often form in response to repeated friction or pressure on the skin. This can be caused by wearing ill-fitting shoes that squeeze the toes or rub against the skin, especially in areas like the toes or sides of the feet.\n
    ● High Heels or Tight Shoes: Shoes with high heels or narrow, pointed toes can force the toes into unnatural positions, causing friction and pressure on the skin. This increases the risk of developing corns on the toes or sides of the feet.\n
    ● Activities or Occupations: Certain activities or occupations that involve prolonged standing, walking, or repetitive motions can contribute to the formation of corns. For example, athletes, dancers, and individuals who work on their feet for extended periods may be more prone to developing corns.\n
    ● Footwear without Socks: Wearing shoes without socks or with thin socks can increase friction between the shoe and the skin, making corns more likely to develop.\n
    To avoid ingrown toenails, cut your nails straight across. The top of your nail should make a straight line. Do not pick at your nails or tear them at the corners. Wear shoes that fit correctly and allow plenty of room for your toes. Avoid high heels and tight-fitting shoes.
""",
    isPriceing: true,
  );
}
