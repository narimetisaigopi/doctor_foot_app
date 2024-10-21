import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class Plantarfascitis {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.planter,
    title: "Plantar Fasciitis",
    about:
        """Plantar fasciitis is one of the most common conditions causing heel pain. It involves inflammation of the plantar fascia — a tough, fibrous band of tissue that runs along the sole of the foot. The plantar fascia attaches to the heel bone and to the base of the toes. It helps support the arch of the foot and has an important role in normal foot mechanics during walking.

           Tension or stress in the plantar fascia increases when you place weight on the foot, such as withstanding. The tension also increases when you push off on the ball of the foot and toes. Both of these motions occur during normal walking or running. With overuse or in time, the fascia loses some of its elasticity or resilience and can become irritated with routine daily activities.
""",
    isPriceing: true,
  );
}
