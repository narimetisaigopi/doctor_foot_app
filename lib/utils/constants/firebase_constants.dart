import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference usersCollectionReference =
    FirebaseFirestore.instance.collection("users");

CollectionReference couponCodesCollectionReference =
    FirebaseFirestore.instance.collection("coupon_codes");
    
CollectionReference addressesCollectionReference =
    FirebaseFirestore.instance.collection("addresses");
CollectionReference dietCollectionReference =
    FirebaseFirestore.instance.collection("diet");

CollectionReference ulcerSubscrptionsCollectionReference =
    FirebaseFirestore.instance.collection("ulcer_monitoring_subscriptions");
CollectionReference ulcerMonitoringRecordsCollectionReference =
    FirebaseFirestore.instance.collection("ulcer_monitoring_records");
CollectionReference paymentsCollectionReference =
    FirebaseFirestore.instance.collection("payments");



CollectionReference reviewsCollectionReference =
    FirebaseFirestore.instance.collection("reviews");

CollectionReference adminCollectionReference =
    FirebaseFirestore.instance.collection("admin");

DocumentReference documentReference =
    FirebaseFirestore.instance.collection("admin").doc("admin");

CollectionReference doctorsAppointmentsCollectionReference =
    FirebaseFirestore.instance.collection("doctors_appointments");

CollectionReference footServicesAppointmentsCollectionReference =
    FirebaseFirestore.instance.collection("foot_services_appointments");

CollectionReference articlesAndBlogsCollectionReference =
    FirebaseFirestore.instance.collection("articles_blogs");

CollectionReference hospitalsCollectionReference =
    FirebaseFirestore.instance.collection("hospitals");

CollectionReference doctorsCollectionReference =
    FirebaseFirestore.instance.collection("doctors");

CollectionReference bannersCollectionReference =
    FirebaseFirestore.instance.collection("banners");

CollectionReference noUlcerCollectionReference =
    FirebaseFirestore.instance.collection("no_ulcer");
CollectionReference riskCheckerCollectionReference =
    FirebaseFirestore.instance.collection("riskchecker");

CollectionReference adminReviewsCollectionReference =
    FirebaseFirestore.instance.collection("admin_reviews");

const String storageHomeService = "homeservice";
const String storageProfile = "profiles";
const String storageArticlesBlogs = "articles_blogs";
const String storageHospitals = "hospitals";
const String storageDoctors = "doctors";
const String storageBanners = "banners";
const String storageNoUlcer = "no_ulcer";
const String storageUlcerMonitoringRecords = "ulcer_monitoring_records";

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
