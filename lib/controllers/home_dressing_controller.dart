import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/payment_controller.dart';
import 'package:drfootapp/models/home_dressing/home_dressing_model.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class HomeDressingController extends GetxController {
  final TextEditingController serviceTitleController = TextEditingController();
  final TextEditingController serviceDaysController = TextEditingController();
  final TextEditingController serviceDescriptionController =
      TextEditingController();
  final TextEditingController serviceOldPriceController =
      TextEditingController();
  final TextEditingController serviceNewPriceController =
      TextEditingController();

  List<HomeDressingModel> homeDressingServicesAddedList = [];

  var finalAmount = 0.0, discountAmount = 0.0, payableAmount = 0.0;

  TextEditingController searchCouponCodeController = TextEditingController();
  void addOrRemoveFromList({
    required HomeDressingModel homeDressingModel,
  }) {
    bool isExisted = isServiceAdded(homeDressingModel);

    if (isExisted) {
      homeDressingServicesAddedList
          .removeWhere((item) => item.docId == homeDressingModel.docId);
    } else {
      homeDressingServicesAddedList.add(homeDressingModel);
    }
    calculateRemovedService();
    update();
  }

  bool isServiceAdded(
    HomeDressingModel homeDressingModel,
  ) {
    bool isExisted = homeDressingServicesAddedList
        .where((element) => element.docId == homeDressingModel.docId)
        .isNotEmpty;
    return isExisted;
  }

  void clearTextFields() {
    serviceTitleController.clear();
    serviceDaysController.clear();
    serviceDescriptionController.clear();
    serviceNewPriceController.clear();
    serviceOldPriceController.clear();
  }

  void calculateRemovedService() {
    finalAmount = 0.0;
    discountAmount = 0.0;
    payableAmount = 0.0;

    for (var item in homeDressingServicesAddedList) {
      finalAmount += item.newPrice;
      discountAmount += (item.oldPrice - item.newPrice);
    }

    payableAmount = finalAmount - discountAmount;

    update();
  }

  Future<void> addServices(
      HomeDressingModel homeDressingServices, BuildContext context) async {
    if (FirebaseAuth.instance.currentUser != null) {
      QuerySnapshot querySnapshot =
          await homeDressingServicesCollectionReference
              .where("uId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .get();
      DocumentReference documentReference =
          homeDressingServicesCollectionReference.doc();
      HomeDressingModel homeDressingModel = HomeDressingModel();
      homeDressingModel.title = homeDressingServices.title;

      if (querySnapshot.docs.isEmpty) {
        homeDressingModel.uId = FirebaseAuth.instance.currentUser!.uid;

        homeDressingModel.docId = documentReference.id;
        homeDressingServicesAddedList.add(homeDressingServices);
        await documentReference.set(homeDressingServices.toMap());
      } else {}
      Utility.toast("Service added");

      update();
    }
  }

  proceedToPayment() {
    PaymentController paymentController = Get.put(PaymentController());
    paymentController.startPayment(
        onSuccess: (PaymentSuccessResponse paymentSuccessResponse) {},
        onError: (PaymentFailureResponse paymentFailureResponse) {},
        onExternalWallet: (ExternalWalletResponse externalWalletResponse) {});
  }
}
