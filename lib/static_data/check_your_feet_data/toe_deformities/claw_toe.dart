import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class ClawToe {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.claw_toe_full_image,
    title: "Claw Toe",
    averageRating: 4.4,
    reviewCount: 320,
    subTitle: "Corner of the nail digs \ninto the skin of the toe",
     actualPrice: 499,
    offerPrice: 399,
    about:
        """Claw toe is a common foot deformity in which your toes bend into a claw-like position, digging down into the soles of your shoes and creating painful calluses on the top or tips of the toes. People often blame claw toe on wearing shoes that squeeze your toes, such as shoes that are too short or high heels. However, claw toes often are the result of nerve damage caused by diseases like diabetes or alcoholism, which can weaken the muscles in your foot. Claw toes can get worse without treatment and may become a permanent deformity over time. 
        There are several signs of claw toe:
       ● Your toes are bent upward (extension) from the joints at the ball of the foot.
       ● Your toes are bent downward (flexion) at the middle joints toward the sole of your shoe.
       ● Sometimes your toes also bend downward at the top joints, curling under the foot.
""",
    isPriceing: true,
  );
}
