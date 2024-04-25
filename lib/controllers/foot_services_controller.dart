import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/coupon_code_controller.dart';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/controllers/payment_controller.dart';
import 'package:drfootapp/models/address_model.dart';
import 'package:drfootapp/models/admin_model.dart';
import 'package:drfootapp/models/homeScreenModels/foot_service_booking_model.dart';
import 'package:drfootapp/models/home_dressing/home_dressing_model.dart';
import 'package:drfootapp/models/payment_model.dart';
import 'package:drfootapp/screens/home_dressing_services/foot_service_order_successful_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class FootServiceController extends GetxController {
  final TextEditingController serviceTitleController = TextEditingController();
  final TextEditingController serviceDurationsController =
      TextEditingController();
  final TextEditingController serviceDescriptionController =
      TextEditingController();
  final TextEditingController serviceOriginalPriceController =
      TextEditingController();
  final TextEditingController serviceOfferPriceController =
      TextEditingController();
  int? selectedFootService, selectedDressingService;

  List<FootServiceModel> homeDressingServicesAddedList = [];

  var finalAmount = 0.0, discountAmount = 0.0;
  bool isLoading = false;

  XFile? pickedFile;

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
    required FootServiceModel homeDressingModel,
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
    FootServiceModel homeDressingModel,
  ) {
    bool isExisted = homeDressingServicesAddedList
        .where((element) => element.docId == homeDressingModel.docId)
        .isNotEmpty;
    return isExisted;
  }

  void clearTextFields() {
    selectedFootService = null;
    selectedDressingService = null;
    serviceTitleController.clear();
    serviceDurationsController.clear();
    serviceDescriptionController.clear();
    serviceOfferPriceController.clear();
    serviceOriginalPriceController.clear();
    pickedFile = null;
  }

  void calculateRemovedService() {
    finalAmount = 0.0;
    discountAmount = 0.0;
    for (var item in homeDressingServicesAddedList) {
      finalAmount += item.offerPrice;
      discountAmount += (item.originalPrice - item.offerPrice);
    }
    update();
  }

  setServiceData(FootServiceModel homeDressingModel) {
    homeDressingModel.footService = FootServices.values[selectedFootService!];
    if (selectedDressingService != null) {
      homeDressingModel.dressingService =
          DressingServices.values[selectedDressingService!];
    }
    homeDressingModel.originalPrice =
        double.parse(serviceOriginalPriceController.text);
    homeDressingModel.offerPrice =
        double.parse(serviceOfferPriceController.text);
    homeDressingModel.title = serviceTitleController.text;
    homeDressingModel.description = serviceDescriptionController.text;
    homeDressingModel.duration = serviceDurationsController.text;
    homeDressingModel.isActive = true;
  }

  Future<void> addNewService() async {
    try {
      _updateLoading(true);
      DocumentReference documentReference =
          homeDressingServicesCollectionReference.doc();
      FootServiceModel homeDressingModel = FootServiceModel();
      if (pickedFile != null) {
        String path = await Get.put(FirebaseStorageController())
            .uploadImageToFirebase(
                directoryName: storageHomeService, uploadFile: pickedFile!);
        homeDressingModel.image = path;
      }
      setServiceData(homeDressingModel);
      homeDressingModel.uid = getCurrentUserId();
      homeDressingModel.docId = documentReference.id;
      await documentReference.set(homeDressingModel.toMap());
      Utility.toast("Service added.");
      Get.back();
    } catch (e) {
      logger(e.toString());
    } finally {
      _updateLoading(false);
    }
  }

  Future<void> updateService(FootServiceModel homeDressingModel) async {
    try {
      FirebaseStorageController firebaseStorageController =
          Get.put(FirebaseStorageController());
      _updateLoading(true);
      if (pickedFile != null) {
        String path = await firebaseStorageController.uploadImageToFirebase(
            directoryName: storageHomeService, uploadFile: pickedFile!);
        firebaseStorageController.deleteImage(homeDressingModel.image);
        homeDressingModel.image = path;
      }
      setServiceData(homeDressingModel);
      homeDressingModel.uid = getCurrentUserId();
      await homeDressingServicesCollectionReference
          .doc(homeDressingModel.docId)
          .update(homeDressingModel.toMap());
      Utility.toast("Service updated.");
      Get.back();
    } catch (e) {
      logger(e.toString());
    } finally {
      _updateLoading(false);
    }
  }

  Future<void> deleteService(FootServiceModel homeDressingModel) async {
    try {
      _updateLoading(true);
      await homeDressingServicesCollectionReference
          .doc(homeDressingModel.docId)
          .update({"isActive": false});
      Utility.toast("Service deleted.");
      Get.back();
    } catch (e) {
      logger(e.toString());
    } finally {
      _updateLoading(false);
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
      ServiceBookingOrderModel orderModel = ServiceBookingOrderModel();
      DocumentReference documentReference =
          footServicesCollectionReference.doc();
      orderModel.docId = documentReference.id;
      orderModel.amount = finalAmount;
      orderModel.orderStatus = OrderStatus.upcoming;
      orderModel.uid = getCurrentUserId();
      orderModel.discount = discountAmount;
      orderModel.orderId = orderId;
      orderModel.timestamp = Timestamp.now();
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
      Get.offAll(() => FootServiceOrderSuccessfulScreen(
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
