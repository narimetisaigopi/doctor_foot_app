import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/user_model.dart';
import 'package:drfootapp/screens/auth_screens/otp_screen.dart';
import 'package:drfootapp/screens/nurse/auth_screens/nurse_signup_screen.dart';
import 'package:drfootapp/screens/nurse/nurse_dash_board_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/sp_helper.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NurseAuthController extends GetxController {
  UserModel loginUserModel = UserModel();

  bool isLoading = false;
  String _verificationId = "";
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  int? forceResendingToken;

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

  void updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  // this method is used to send otp to user .
  firebaseSendOTP(BuildContext context) async {
    updateLoading(true);
    this.context = context;

    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: "+91${mobileNumberController.text}",
          timeout: const Duration(seconds: 5),
          forceResendingToken: forceResendingToken,
          verificationCompleted: _verificationCompleted,
          verificationFailed: _verificationFailed,
          codeSent: _codeSent,
          codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
    } catch (e) {
      Utility.toast("Failed to Verify Phone Number: $e",
          backgroundColor: Colors.red);
    } finally {
      updateLoading(false);
    }
  }

  _codeSent(verificationId, forceResendingToken) {
    Utility.toast("OTP Sent.",
        backgroundColor: Colors.green, textColor: Colors.white);
    this.forceResendingToken = forceResendingToken;
    _verificationId = verificationId;
    Utility.myBottomSheet(context, widget: const OtpScreen());
  }

  _verificationCompleted(phoneAuthCredential) async {
    otpController.text = phoneAuthCredential.smsCode.toString();
    await _firebasePhoneAuthVerifyCredentials(phoneAuthCredential);
  }

  // when otp verification failed
  _verificationFailed(FirebaseAuthException authException) {
    logger("authException ${authException.message}");
    Utility.toast("Error to send otp", textColor: Colors.red);
  }

  _codeAutoRetrievalTimeout(verificationId) {
    _verificationId = verificationId;
  }

  _firebasePhoneAuthVerifyCredentials(AuthCredential authCredential) async {
    try {
      updateLoading(true);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(authCredential);
      if (userCredential.user != null) {
        UserModel? userModel = await getUserDataAndStoreLocally();
        if (userModel == null) {
          // user data is not existed so inserting the data
          Utility.myBottomSheet(context,
              widget: const NurseSignUpScreen(), heightFactor: 0.7);
        } else {
          // if login taking directly to sign up
          await updateDeviceToken();
          Get.offAll(() => const NurseDashBoardScreen());
        }
      } else {
        Utility.toast("Something went wrong, please try again.",
            backgroundColor: Colors.red);
      }
    } catch (e, stack) {
      logger(e.toString());
      logger(stack.toString());
      Utility.toast(e.toString(), backgroundColor: Colors.red);
    } finally {
      updateLoading(false);
    }
  }

  // this method will verify the otp and perform the operation after that
  firebaseVerifyOTP(String enteredOTP) async {
    try {
      AuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: enteredOTP);
      await _firebasePhoneAuthVerifyCredentials(authCredential);
    } catch (e, stack) {
      logger("message $e");
      logger("message $stack");
      Utility.toast("$e", backgroundColor: Colors.red);
    }
  }

  Future<UserModel?> getUserDataAndStoreLocally() async {
    if (FirebaseAuth.instance.currentUser != null) {
      DocumentSnapshot documentSnapshot = await getCurrentUserDocRef().get();
      logger(documentSnapshot.data().toString());
      if (documentSnapshot.data() != null) {
        loginUserModel = UserModel.fromJson(documentSnapshot.data() as Map);
        return loginUserModel;
      }
    }
    return null;
  }

  DocumentReference getCurrentUserDocRef() {
    return usersCollectionReference.doc(FirebaseAuth.instance.currentUser?.uid);
  }

  Future<bool> isUsernameExisted() async {
    QuerySnapshot querySnapshot = await usersCollectionReference
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
    mobileNumberController.clear();
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
