import 'package:drfootapp/utils/constants/string_constants.dart';

class AppointmentRatingModel {
  String name;
  String rating;
  String totalReviews;
  String location;
  String date;
  bool isExpired;

  AppointmentRatingModel({
    this.name = "",
    this.rating = "",
    this.totalReviews = "",
    this.location = "",
    this.date = "",
    this.isExpired = false,
  });
}

List<AppointmentRatingModel> appointmentList = [
  AppointmentRatingModel(
    name: Strings.loremIpsumText,
    rating: Strings.rateText,
    totalReviews: Strings.totalReview,
    location: Strings.oppointmentLocationText,
    date: Strings.oppointmentdateText,
  )
];
