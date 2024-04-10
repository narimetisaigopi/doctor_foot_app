// ignore_for_file: unused_field

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/admin/admin_panel.dart';
import 'package:drfootapp/models/user_model.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  String _verificationId = "";
  bool isLoading = false;
  int? forceResendingToken;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? smsCode;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController userNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  firebasePhoneAuthVerifyCredentials(AuthCredential authCredential) async {
    try {
      updateLoading(true);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(authCredential);
      if (userCredential.user != null) {
        log("userCredential ${userCredential.user!.phoneNumber}");
        await firebaseAuthInsertData();
        Get.offAll(() => const DashBoardScreen());
      } else {
        Utility.toast("Something went wrong, please try again.",
            backgroundColor: Colors.red);
      }
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      Utility.toast(e.toString(), backgroundColor: Colors.red);
      updateLoading(false);
    }
  }

  void updateLoading(bool loading) {
    isLoading = loading;
    Future.delayed(const Duration(milliseconds: 200), () {
      update();
    });
  }

  // this method is used to send otp to user .
  firebaseSendOTP() async {
    // Step 1 : the otp is sent to this method #codeSent
    codeSent(verificationId, forceResendingToken) {
      Utility.toast("OTP Sent.",
          backgroundColor: Colors.green, textColor: Colors.white);
      this.forceResendingToken = forceResendingToken;
      _verificationId = verificationId;
    }

    verificationCompleted(phoneAuthCredential) async {
      otpController.text = phoneAuthCredential.smsCode.toString();
      await firebasePhoneAuthVerifyCredentials(phoneAuthCredential);
    }

    // when otp verification failed
    verificationFailed(FirebaseAuthException authException) {
      print(
          "PhoneVerificationFailed authException ${authException.toString()}");

      Utility.toast("Error to send otp", textColor: Colors.red);
    }

    codeAutoRetrievalTimeout(verificationId) {
      _verificationId = verificationId;
    }

    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: "+91${mobileNumberController.text}",
          timeout: const Duration(seconds: 5),
          forceResendingToken: forceResendingToken,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      Utility.toast("Failed to Verify Phone Number: $e",
          backgroundColor: Colors.red);
    }
    updateLoading(false);
  }

  // this method will verify the otp and perform the operation after that
  firebaseVerifyOTP(String enteredOTP) async {
    try {
      AuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: enteredOTP);
      await firebasePhoneAuthVerifyCredentials(authCredential);
    } catch (e, stack) {
      log("message$e");
      log("message$stack");
      Utility.toast("$e", backgroundColor: Colors.red);
    }
  }

  DocumentReference getCurrentUserDocRef() {
    return usersCollectionReference.doc(FirebaseAuth.instance.currentUser?.uid);
  }

  firebaseAuthInsertData() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      UserModel userModel = UserModel();
      userModel.userName = userNameController.text;
      userModel.mobileNumber = user!.phoneNumber!;
      userModel.docId = getCurrentUserDocRef().id;
      userModel.dateOfBirth = dateOfBirthController.text;
      userModel.gender = genderController.text;
      userModel.timestamp = DateTime.now() as Timestamp?;
      await getCurrentUserDocRef().set(userModel.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signInwithEmail(String email, String password) async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => const AdminPanel());
    } catch (e) {
      log(e.toString());
    }
  }

  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
}
