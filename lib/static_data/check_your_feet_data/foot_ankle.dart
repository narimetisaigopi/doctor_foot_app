import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class FootAnkle {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.foot_and_ankle,
    title: "Foot Ankle Arthiritis",
    about:
        """Arthritis is inflammation of one or more of your joints. It can cause pain and stiffness in any joint in the body and is common in the small joints of the foot and ankle.  
        There are more than 100 forms of arthritis, many of which affect the foot and ankle. All types can make it difficult to walk and perform activities you enjoy.
       Although there is no cure for arthritis, there are many treatment options available to slow the progress of the disease and relieve symptoms. With proper treatment, many people with arthritis are able to manage their pain, remain active, and lead fulfilling lives.

""",
    isPriceing: true,
  );
}
