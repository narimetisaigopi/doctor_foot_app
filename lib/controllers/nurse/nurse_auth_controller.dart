import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/partner_model.dart';
import 'package:drfootapp/screens/auth_screens/privacy_screen.dart';
import 'package:drfootapp/screens/nurse/auth_screens/nurse_otp_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/sp_helper.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PartnerModel loginPartnerModel = PartnerModel();

class NurseAuthController extends GetxController {
  bool isLoading = false;

  updateLoading(bool status) {
    isLoading = status;
    update();
  }

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController collegeUnisersityController = TextEditingController();
  TextEditingController yearofCompletionController = TextEditingController();
  TextEditingController degreeCertiController = TextEditingController();

  int selectedGenderIndex = -1;
  late BuildContext context;

  Map<String, dynamic> partnerEducationDetailsMap = {};

  String sentOTP = "";

  Future<bool> signIn(BuildContext context) async {
    bool status = false;
    try {
      updateLoading(true);
      if (await isMobileExisted()) {
        Utility.toast("Mobile number not registered.");
      } else {
        await sendOTP();
      }
    } catch (e) {
      logger(e);
    } finally {
      updateLoading(false);
    }
    return status;
  }

  sendOTP() async {
    sentOTP = generateOtp();
    await sendSMS(sentOTP);
    Utility.myBottomSheet2(widget: const NurseOtpScreen());
  }

  verifyOTP(String otp) async {
    try {
      if (sentOTP == otp) {
        if (await getUserDataAndStoreLocally() != null) {
          // Get.to(() => const NurseDashBoardScreen());
          Utility.myBottomSheet2(
              widget: const PrivacyScreen(), heightFactor: 0.8);
        } else {
          Utility.toast("Something went wrong please try again.");
        }
      } else {
        Utility.toast("Invalid OTP");
      }
    } catch (e) {
      Utility.toast("Something went wrong please try again. $e");
    }
  }

  Future<bool> signUp() async {
    bool status = false;
    try {
      updateLoading(true);
      if (!await isMobileExisted()) {
        Utility.toast("Mobile number already existed");
      } else if (!await isUsernameExisted()) {
        Utility.toast("Username already existed");
      } else {
        DocumentReference documentReference = partnersCollectionReference.doc();
        PartnerModel partnerModel = PartnerModel(
            docId: documentReference.id,
            userName: userNameController.text,
            age: int.parse(ageController.text),
            gender: genderController.text,
            city: cityController.text,
            mobileNumber: mobileNumberController.text,
            degree: degreeController.text,
            timestamp: DateTime.now());
        await documentReference.set(partnerModel.toJson());
        Utility.toast("Registration successfully");
        status = true;
      }
    } catch (e) {
      logger(e);
    } finally {
      updateLoading(false);
    }
    return status;
  }

  Future<PartnerModel?> getUserDataAndStoreLocally() async {
    if (mobileNumberController.text.isNotEmpty) {
      PartnerModel dataPartnerModel =
          await getDataByMobileNumber(mobileNumberController.text);
      if (dataPartnerModel.docId.isNotEmpty) {
        loginPartnerModel = dataPartnerModel;
        await SPHelper.setUser(dataPartnerModel);
        return dataPartnerModel;
      }
    }
    return null;
  }

  Future<bool> isUsernameExisted() async {
    QuerySnapshot querySnapshot = await partnersCollectionReference
        .where("userName", isEqualTo: userNameController.text.toLowerCase())
        .get();
    logger("message ${querySnapshot.docs.length}");
    if (querySnapshot.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<PartnerModel> getDataByMobileNumber(String mobileNumber) async {
    QuerySnapshot querySnapshot = await partnersCollectionReference
        .where("mobileNumber", isEqualTo: mobileNumber)
        .get();
    PartnerModel partnerModel = PartnerModel();
    if (querySnapshot.docs.isNotEmpty) {
      partnerModel =
          PartnerModel.fromJson(querySnapshot.docs.first.data() as Map);
    }
    return partnerModel;
  }

  Future<bool> isMobileExisted() async {
    QuerySnapshot querySnapshot = await partnersCollectionReference
        .where("mobileNumber", isEqualTo: mobileNumberController.text)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  clearSignUpFields() {
    userNameController.clear();
    dateOfBirthController.clear();
    selectedGenderIndex = -1;
    genderController.clear();
    mobileNumberController.clear();
    degreeController.clear();
  }

  updateDeviceToken({bool clearIt = false}) async {}
}
