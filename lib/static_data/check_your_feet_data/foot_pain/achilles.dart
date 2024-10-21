import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class Achilles {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.metatarsalgia,
    title: "Achilles tendonitis",
    about:
        """An overuse injury to the Achilles tendon, which connects your heel bone to the calf muscles at the rear of your lower leg, is known as Achilles tendonitis. 
           Achilles tendonitis most frequently affects runners who have abruptly increased their run length or intensity. It's also typical among middle-aged individuals who participate in weekend-only activities like basketball or tennis. 
           Under your doctor's guidance, the majority of cases of Achilles tendinitis can be treated with reasonably straightforward at-home care. In most cases, self-care techniques are required to stop recurrent episodes. Severe instances of Achilles tendinitis can result in tendon ruptures or rips, which may need to be surgically repaired.
         
""",
    isPriceing: true,
  );
}
