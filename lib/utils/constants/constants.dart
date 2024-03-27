import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

List<String> addressLabel = ["Home", "Work", "Family & friends", "Others"];

List<String> names = [
  Strings.premiumPlanText1,
  Strings.premiumPlanText2,
  Strings.premiumPlanText3,
  Strings.premiumPlanText4,
  Strings.premiumPlanText5,
//Strings.premiumPlanText6,
];
// List<String> names2 = [
//   Strings.freePlan1,
//   Strings.freePlan2,
//   Strings.freePlan3,
// ];

final List<String> options = [
  'Total Users',
  'Coupon Codes Screen',
  'Home Dressing Services'
];

const introScreenImages = [
  {
    "image": AssetsConstants.dr_consult,
  },
  {
    "image": AssetsConstants.dr_checkup,
  },
  {
    "image": AssetsConstants.dr_consult,
  },
  {
    "image": AssetsConstants.dr_patiant_checkup,
  },
];
const serviceMap = [
  {"image": AssetsConstants.foot, "name": Strings.footUlcer_text},
  {"image": AssetsConstants.speedometer, "name": Strings.checkYourRisk_text},
  {
    "image": AssetsConstants.checkup_shedule,
    "name": Strings.checkup_schedule_text
  },
  {"image": AssetsConstants.foot_service, "name": Strings.foot_service_text}
];
const patientReviewsMap = [
  {
    "reviewer_image": AssetsConstants.user_image,
    "patientName": Strings.reviewverName,
    "discription": Strings.userReviewDicriptionText,
    "date": Strings.postedDateText,
    "image": AssetsConstants.dr_patiant_checkup,
  },
];
