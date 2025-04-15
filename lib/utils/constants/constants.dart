import 'dart:developer';

import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

const String mapKey = "";

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
const String hospitals = 'Hospitals';
const String doctors = 'Doctors';
const String banners = 'Banners';
const String adminReviews = 'Admin Reviews';

final List<String> dashboardMenuOptions = [
  user,
  couponCodes,
  homeDressingServices,
  orders,
  dietChart,
  articlesAndBlogs,
  hospitals,
  banners,
  adminReviews
];
final List<String> chooseTimes = [
  '09 AM - 11 AM',
  '11 AM - 01 PM',
  '01 PM - 03 PM',
  '03 PM - 05 PM',
  '05 PM - 07 PM',
  '07 PM - 09 PM',
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

const String earlyMorning = "Early Morning";
const String breakfast = "Breakfast";
const String midMorningSnack = "Mid Morning Snack";
const String lunch = "Lunch";
const String eveningSnack = "Evening Snack";
const String dinner = "Dinner";
const String beforeBedtime = "Before Bedtime";

final dietTitlesList = [
  earlyMorning,
  breakfast,
  midMorningSnack,
  lunch,
  eveningSnack,
  dinner,
  beforeBedtime,
];

final dietTimingsList = [
  "6am-7am",
  "8am-9am",
  "11am-11.30am",
  "1pm-2pm",
  "4pm-6pm",
  "8pm-9pm",
];

// Mapping titles to their corresponding time slots
final dietTimeMapping = {
  "Early Morning": "6am-7am",
  "Breakfast": "8am-9am",
  "Mid Morning Snack": "11am-11.30am",
  "Lunch": "1pm-2pm",
  "Evening Snack": "4pm-6pm",
  "Dinner": "8pm-9pm",
  "Before Bedtime": "8pm-9pm",
};

const String rupeeSymbol = "₹";

const List<String> allowedImageExtensions = ['jpg', 'png', 'jpeg'];
