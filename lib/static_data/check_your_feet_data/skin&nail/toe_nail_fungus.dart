import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

class ToeNailFungus {
  static CheckYourFeetDataModel checkYourFeetDataModelList =
      CheckYourFeetDataModel(
    image: AssetsConstants.toe_nail_fungus_full_image,
    title: "ToeNail Fungus",
    averageRating: 4.4,
    reviewCount: 320,
    subTitle: "Corner of the nail digs \ninto the skin of the toe",
    actualPrice: 399,
    offerPrice: 499,
    about:
        """Folliculitis is a skin disorder involving the inflammation of hair follicles. It is typically due to an infection and results in irritated pimple-like spots or pustules. Antibiotic or antifungal creams and other therapies can help.\n 
    Most fungal nail infections are not serious. However, some people may experience pain or be bothered by the appearance of their nails.\n
    Fungal nail infections may cause nails to become discolored, thick, fragile, or cracked. The nail may also become separated from the nail bed. \n
    People who have fungal toenail infections often have a fungal skin infection on the foot, especially between the toes (commonly called athlete’s foot, ringworm on the foot, or tinea pedis). \n
    
""",
    isPriceing: true,
  );
}
