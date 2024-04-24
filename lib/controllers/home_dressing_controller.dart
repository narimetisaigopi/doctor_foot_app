import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/coupon_code_controller.dart';
import 'package:drfootapp/controllers/payment_controller.dart';
import 'package:drfootapp/models/address_model.dart';
import 'package:drfootapp/models/admin_model.dart';
import 'package:drfootapp/models/homeScreenModels/order_model.dart';
import 'package:drfootapp/models/home_dressing/home_dressing_model.dart';
import 'package:drfootapp/models/payment_model.dart';
import 'package:drfootapp/screens/home_dressing_services/order_successful_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
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

  bool isLoading = false;

  AddressModel selectedAddressModel = AddressModel();

  updateAddressSelection(AddressModel addressModel) {
    selectedAddressModel = addressModel;
  }

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

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

  Future<int> generateOrderId() async {
    DocumentSnapshot documentSnapshot =
        await adminCollectionReference.doc("admin").get();
    int orderId = 1;
    AdminModel adminModel = AdminModel();
    if (documentSnapshot.exists && documentSnapshot.data() != null) {
      adminModel = AdminModel.fromSnapshot(documentSnapshot);
      orderId = adminModel.orderId + 1;
      await adminCollectionReference.doc("admin").update({"orderId": orderId});
    } else {
      await adminCollectionReference.doc("admin").set(adminModel.toMap());
    }
    return orderId;
  }

  placeOrder() async {
    try {
      _updateLoading(true);
      CouponCodeController couponCodeController =
          Get.put(CouponCodeController());
      PaymentController paymentController = Get.put(PaymentController());
      int orderId = await generateOrderId();
      OrderModel orderModel = OrderModel();
      DocumentReference documentReference = ordersCollectionReference.doc();
      orderModel.docId = documentReference.id;
      orderModel.amount = finalAmount;
      orderModel.uid = getCurrentUserId();
      orderModel.discount = discountAmount;
      orderModel.orderId = orderId;
      // adding item ids to list
      List<String> ids =
          homeDressingServicesAddedList.map((e) => e.docId).toList();
      orderModel.items = [...ids];
      orderModel.quantity = homeDressingServicesAddedList.length;
      // setting coupon code
      if (couponCodeController.selectedCouponCodeModel != null) {
        orderModel.couponCodeId =
            couponCodeController.selectedCouponCodeModel!.docId;
      }
      // setting address
      orderModel.address = selectedAddressModel;
      // setting payment
      PaymentModel paymentModel = await paymentController.addPaymentTransaction(
          amount: finalAmount,
          subscriptionId: orderModel.docId,
          paymentStatus: PaymentStatus.completed,
          paymentServiceType: PaymentServiceType.homeService);
      orderModel.paymentId = paymentModel.docId;
      // creating order
      await documentReference.set(orderModel.toMap());
      Utility.toast("Order placed successfully");
      Get.offAll(() => OrderSuccessfulScreen(
            orderModel: orderModel,
          ));
    } catch (e, stack) {
      Utility.toast("Failed to place order, due to ${e.toString()}");
      logger(e.toString());
      logger(stack.toString());
    } finally {
      _updateLoading(false);
    }
  }

  proceedToPayment() {
    PaymentController paymentController = Get.put(PaymentController());
    paymentController.amount = finalAmount;
    paymentController.description = "Home services";
    paymentController.startPayment(
        onSuccess: (PaymentSuccessResponse paymentSuccessResponse) async {
      await placeOrder();
    }, onError: (PaymentFailureResponse paymentFailureResponse) {
      Utility.toast("Payment failed due to  ${paymentFailureResponse.message}");
      _updateLoading(false);
    }, onExternalWallet: (ExternalWalletResponse externalWalletResponse) {
      Utility.toast(
          "onExternalWallet: payment failed due to  ${externalWalletResponse.walletName}");
      _updateLoading(false);
    });
  }
}
