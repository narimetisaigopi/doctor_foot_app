import 'package:drfootapp/utils/constants/string_constants.dart';

class AppointmentModel {
  String name;
  String rating;
  String totalReviews;
  String location;
  String date;
  bool isExpired;

  AppointmentModel({
    this.name = "",
    this.rating = "",
    this.totalReviews = "",
    this.location = "",
    this.date = "",
    this.isExpired = false,
  });
}

List<AppointmentModel> appointmentList = [
  AppointmentModel(
    name: Strings.loremIpsumText,
    rating: Strings.rateText,
    totalReviews: Strings.totalReview,
    location: Strings.oppointmentLocationText,
    date: Strings.oppointmentdateText,
  )
];
