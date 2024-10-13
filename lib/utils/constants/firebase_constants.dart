import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference usersCollectionReference =
    FirebaseFirestore.instance.collection("users");

CollectionReference couponCodesCollectionReference =
    FirebaseFirestore.instance.collection("coupon_codes");

CollectionReference footServicesCollectionReference =
    FirebaseFirestore.instance.collection("foot_services");
CollectionReference footServicesBookingsCollectionReference =
    FirebaseFirestore.instance.collection("foot_services_bookings");

CollectionReference addressesCollectionReference =
    FirebaseFirestore.instance.collection("addresses");
CollectionReference dietCollectionReference =
    FirebaseFirestore.instance.collection("diet");

CollectionReference ulcerSubscrptionsCollectionReference =
    FirebaseFirestore.instance.collection("ulcer_monitoring_subscriptions");
CollectionReference paymentsCollectionReference =
    FirebaseFirestore.instance.collection("payments");



CollectionReference reviewsCollectionReference =
    FirebaseFirestore.instance.collection("reviews");

CollectionReference adminCollectionReference =
    FirebaseFirestore.instance.collection("admin");

CollectionReference appointmentsCollectionReference =
    FirebaseFirestore.instance.collection("appointments");

CollectionReference articlesAndBlogsCollectionReference =
    FirebaseFirestore.instance.collection("articles_blogs");

CollectionReference hospitalsCollectionReference =
    FirebaseFirestore.instance.collection("hospitals");

CollectionReference doctorsCollectionReference =
    FirebaseFirestore.instance.collection("doctors");

CollectionReference bannersCollectionReference =
    FirebaseFirestore.instance.collection("banners");

const String storageHomeService = "homeservice";
const String storageProfile = "profiles";
const String storageArticlesBlogs = "articles_blogs";
const String storageHospitals = "hospitals";
const String storageDoctors = "doctors";
const String storageBanners = "banners";

final List<String> adminsList = [
  "bandigowtham6@gmail.com",
];
bool amIAdmin() {
  String email = "";
  if (FirebaseAuth.instance.currentUser != null) {
    email = FirebaseAuth.instance.currentUser!.email ?? "";
  }

  return adminsList.contains(email);
}
