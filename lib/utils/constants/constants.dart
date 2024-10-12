import 'dart:developer';

import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

const String appName = "Doctor Foot";

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

const String user = 'Users';
const String couponCodes = 'Coupon Codes';
const String homeDressingServices = 'Home Dressing Services';
const String orders = 'Orders';
const String dietChart = 'Diet Chart';
const String articlesAndBlogs = 'Articles & Blog';

final List<String> dashboardMenuOptions = [
  user,
  couponCodes,
  homeDressingServices,
  orders,
  dietChart,
  articlesAndBlogs
];
final List<String> chooseTimes = [
  '09 AM - 11 AM',
  '11 AM - 01PM',
  '01PM - 03PM',
  '03PM - 05PM',
  '05 PM - 07PM',
  '07PM-09 PM',
];

const introScreenImages = [
  {
    "image": AssetsConstants.dr_consult,
  },
  {
    "image": AssetsConstants.dr_checkup,
  },
  {
    "image": AssetsConstants.dr_patiant_checkup,
  },
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
List<String> bloodGroupList = [
  " A positive (A+)",
  " A negative (A-)",
  " B positive (B+)",
  " B negative (B-)",
  " O positive (O+)",
  " O negative (O-)",
  " AB positive (AB+)",
  " AB negative (AB-)"
];

logger(dynamic message) {
  log("$message");
}

final weeksList = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday"
];

final dietTypesList = ["Veg", "Non-Veg"];
final dietTitlesList = [
  "Early Morning",
  "Breakfast",
  "Mid Morning Snack",
  "Lunch",
  "Evening Snack",
  "Dinner",
  "Before Bedtime",
];

final dietTimingsList = [
  "6am-7am",
  "8am-9am",
  "11am-11.30am",
  "1pm-2pm",
  "4pm-5pm",
  "8pm-9pm",
];

const String rupeeSymbol = "₹";

const List<String> allowedImageExtensions = ['jpg', 'png', 'jpeg'];
