import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/partner_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/sp_helper.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NurseAuthController extends GetxController {
  PartnerModel partnerModel = PartnerModel();
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
    if (FirebaseAuth.instance.currentUser != null) {
      DocumentSnapshot documentSnapshot = await getCurrentUserDocRef().get();
      logger(documentSnapshot.data().toString());
      if (documentSnapshot.data() != null) {
        partnerModel = PartnerModel.fromJson(documentSnapshot.data() as Map);
        return partnerModel;
      }
    }
    return null;
  }

  DocumentReference getCurrentUserDocRef() {
    return partnersCollectionReference
        .doc(FirebaseAuth.instance.currentUser?.uid);
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

  Future<bool> isMobileExisted() async {
    QuerySnapshot querySnapshot = await usersCollectionReference
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

  logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Do you want to logout from the app?"),
          actions: [
            TextButton(
                onPressed: () async {
                  try {
                    Navigator.of(context).pop();
                    await updateDeviceToken(clearIt: true);
                    await FirebaseAuth.instance.signOut();
                  } catch (e) {
                    logger(e.toString());
                  } finally {
                    await SPHelper().clear();
                    // Get.offUntil(
                    //     MaterialPageRoute(
                    //         builder: (builder) => const SplashScreen()),
                    //     (route) => false);
                  }
                },
                child: const Text("Yes")),
            TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: const Text("No"))
          ],
        );
      },
    );
  }

  updateDeviceToken({bool clearIt = false}) async {
    try {
      if (clearIt) {
        await getCurrentUserDocRef()
            .update({"androidToken": "", "appleToken": ""});
        return;
      }
      String? token;
      if (Platform.isAndroid) {
        token = await FirebaseMessaging.instance.getToken();
        await getCurrentUserDocRef().update({"androidToken": token});
      } else if (Platform.isIOS) {
        token = await FirebaseMessaging.instance.getAPNSToken();
        await getCurrentUserDocRef().update({"appleToken": token});
      }
    } catch (e) {
      logger("updateDeviceToken failed exp ${e.toString()}");
    }
  }
}
