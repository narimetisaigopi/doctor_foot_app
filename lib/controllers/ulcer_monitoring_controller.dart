import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/payment_model.dart';
import 'package:drfootapp/models/ulcer_monitor_models/ulcer_monitoring_record_model.dart';
import 'package:drfootapp/models/ulcer_monitor_models/ulcer_monitoring_subscrption_model.dart';
import 'package:drfootapp/models/ulcer_monitor_models/ulcer_monitoring_plan_model.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/screens/payments/razorpay_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'payment_controller.dart';

class UlcerMonitoringController extends GetxController {
  bool isLoading = false;
  List<XFile> selectedImagesList = [];

  onImageSelect(XFile? xfile, int index) {
    if (xfile != null) {
      selectedImagesList.add(xfile);
      update();
    }
  }

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  UlcerMonitoringPlanModel selectedUlcerModel = UlcerMonitoringPlanModel();

  UlcerMonitoringPlanModel freeUlcerMonitoringPlanModel =
      UlcerMonitoringPlanModel(
          id: "0",
          planTitle: Strings.basicPlanText,
          planAmount: 0,
          planDuration: Strings.freeText,
          planDetailItems: [
        Strings.weeklyUmText,
        Strings.freePlanText1,
        Strings.freePlanText2
      ]);

  UlcerMonitoringPlanModel paidUlcerMonitoringPlanModel =
      UlcerMonitoringPlanModel(
          id: "1",
          planTitle: Strings.premiumPlanText,
          planAmount: 1000,
          planDuration: Strings.weekText,
          planDetailItems: [
        Strings.weeklyUmText,
        Strings.freePlanText1,
        Strings.freePlanText2,
        Strings.premiumPlanText4,
        Strings.premiumPlanText5,
      ]);

  List<UlcerMonitoringPlanModel> ulcerPlansList = [];

  @override
  onInit() {
    ulcerPlansList = [
      freeUlcerMonitoringPlanModel,
      paidUlcerMonitoringPlanModel
    ];
    super.onInit();
  }

  updatePlanSelection(UlcerMonitoringPlanModel plan) {
    selectedUlcerModel = plan;
    update();
  }

  proceedToPayment() {
    RazorPayScreen().startPayment(
        amount: selectedUlcerModel.planAmount.toDouble(),
        description: "Ulcer Monitor - ${selectedUlcerModel.planTitle}",
        onSuccess: (PaymentSuccessResponse paymentSuccessResponse) async {
          await addUlcerSubscriptionData(
              PaymentStatus.completed, paymentSuccessResponse.paymentId ?? "");
        },
        onError: (PaymentFailureResponse paymentFailureResponse) {
          addToPayment(
              paymentStatus: PaymentStatus.cancelled,
              message: paymentFailureResponse.message.toString());
        },
        onExternalWallet: (ExternalWalletResponse externalWalletResponse) {});
  }

  addUlcerSubscriptionData(PaymentStatus paymentStatus, String id) async {
    try {
      PaymentController paymentController = Get.put(PaymentController());
      _updateLoading(true);
      await usersCollectionReference.doc(Utility().getCurrentUserId()).update({
        "ulcerMonitoringPlan": selectedUlcerModel.id,
        "ulcerMonitoringSubscriptionDate": Timestamp.now()
      });
      UlcerMonitoringSubscriptionModel ulcerMonitoringSubscriptionModel =
          UlcerMonitoringSubscriptionModel();
      DocumentReference documentReference =
          ulcerSubscrptionsCollectionReference.doc();
      ulcerMonitoringSubscriptionModel.uid = Utility().getCurrentUserId();
      ulcerMonitoringSubscriptionModel.docId = documentReference.id;
      ulcerMonitoringSubscriptionModel.subscriptionId = selectedUlcerModel.id;
      ulcerMonitoringSubscriptionModel.amount = selectedUlcerModel.planAmount;
      ulcerMonitoringSubscriptionModel.paymentStatus = paymentStatus;
      ulcerMonitoringSubscriptionModel.timestamp = Timestamp.now();
      await documentReference.set(ulcerMonitoringSubscriptionModel.toMap());
      await addToPayment(paymentStatus: PaymentStatus.completed, id: id);
      PaymentModel paymentModel = await paymentController.addPaymentTransaction(
          totalAmount: double.parse(selectedUlcerModel.planAmount.toString()),
          paidAmount: double.parse(selectedUlcerModel.planAmount.toString()),
          subscriptionId: ulcerMonitoringSubscriptionModel.docId,
          paymentStatus: PaymentStatus.completed,
          paymentServiceType: PaymentServiceType.ulcerMonitoring);
      await documentReference.update({"paymentId": paymentModel.docId});
      goToPaymentCompletePage();
    } catch (e) {
      logger(e.toString());
    } finally {
      _updateLoading(false);
    }
  }

  addToPayment(
      {required PaymentStatus paymentStatus,
      String message = "",
      String id = ""}) async {
    try {
      _updateLoading(true);
      DocumentReference documentReference = paymentsCollectionReference.doc();
      await Get.put(PaymentController()).addPaymentTransaction(
          totalAmount: selectedUlcerModel.planAmount.toDouble(),
          paidAmount: selectedUlcerModel.planAmount.toDouble(),
          subscriptionId: documentReference.id,
          gatewayTransactionId: id,
          message: message,
          paymentServiceType: PaymentServiceType.ulcerMonitoring,
          paymentStatus: paymentStatus);
      goToPaymentCompletePage();
    } catch (e) {
      logger(e.toString());
    } finally {
      _updateLoading(false);
    }
  }

  String getTodayDocumentId() {
    DateTime date = DateTime.now(); // Example date: 9th Dec 2024
    String formattedDate = DateFormat('ddMMyyyy').format(date);
    return "${Utility().getCurrentUserId()}$formattedDate";
  }

  addUlcerMonitoringRecord() async {
    try {
      _updateLoading(true);
      UlcerMonitoringRecordModel recordModel = UlcerMonitoringRecordModel(
        docId: getTodayDocumentId(),
        uid: Utility().getCurrentUserId(),
      );
      List list = await Get.put(FirebaseStorageController())
          .uploadImagesToFirebase(
              directoryName: storageUlcerMonitoringRecords,
              uploadFiles: selectedImagesList);
      recordModel.uploadedFilesList = list;
      await ulcerMonitoringRecordsCollectionReference
          .doc(recordModel.docId)
          .set(recordModel.toJson());
      Utility.toast("Uploaded successfully.");
      Get.offAll(() => const DashBoardScreen());
    } catch (e) {
      logger(e.toString());
      Utility.toast("Failed to upload image: ${e.toString()}");
    } finally {
      _updateLoading(false);
    }
  }

  Future<UlcerMonitoringRecordModel> getUlcerMonitoringRecord(
      String docId) async {
    DocumentSnapshot documentSnapshot =
        await ulcerMonitoringRecordsCollectionReference.doc(docId).get();
    UlcerMonitoringRecordModel ulcerMonitoringRecordModel =
        UlcerMonitoringRecordModel();
    if (documentSnapshot.exists && documentSnapshot.data() != null) {
      ulcerMonitoringRecordModel =
          UlcerMonitoringRecordModel.fromJson(documentSnapshot.data() as Map);
    }
    return ulcerMonitoringRecordModel;
  }

  goToPaymentCompletePage() {
    Get.offAll(() => const DashBoardScreen());
  }
}
