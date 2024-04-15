// ignore_for_file: unused_field
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/admin/admin_panel.dart';
import 'package:drfootapp/models/user_model.dart';
import 'package:drfootapp/screens/auth_screens/otp_screen.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/splash_screen.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/sp_helper.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  late UserModel userModel;

  late BuildContext context;

  // this method is used to send otp to user .
  firebaseSendOTP(BuildContext context) async {
    _updateLoading(true);
    this.context = context;
    userModel = UserModel();
    userModel.userName = userNameController.text;
    userModel.dateOfBirth = dateOfBirthController.text;
    userModel.gender = genderController.text;
    userModel.mobileNumber = mobileNumberController.text;
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: "+91${userModel.mobileNumber}",
          timeout: const Duration(seconds: 5),
          forceResendingToken: forceResendingToken,
          verificationCompleted: _verificationCompleted,
          verificationFailed: _verificationFailed,
          codeSent: _codeSent,
          codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
    } catch (e) {
      Utility.toast("Failed to Verify Phone Number: $e",
          backgroundColor: Colors.red);
    }
    _updateLoading(false);
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
    Utility.toast("Error to send otp", textColor: Colors.red);
  }

  _codeAutoRetrievalTimeout(verificationId) {
    _verificationId = verificationId;
  }

  _firebasePhoneAuthVerifyCredentials(AuthCredential authCredential) async {
    try {
      _updateLoading(true);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(authCredential);
      if (userCredential.user != null) {
        await _firebaseAuthInsertData();
        Get.offAll(() => const DashBoardScreen());
      } else {
        Utility.toast("Something went wrong, please try again.",
            backgroundColor: Colors.red);
      }
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      Utility.toast(e.toString(), backgroundColor: Colors.red);
      _updateLoading(false);
    }
  }

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  // this method will verify the otp and perform the operation after that
  firebaseVerifyOTP(String enteredOTP) async {
    try {
      AuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: enteredOTP);
      await _firebasePhoneAuthVerifyCredentials(authCredential);
    } catch (e, stack) {
      log("message $e");
      log("message $stack");
      Utility.toast("$e", backgroundColor: Colors.red);
    }
  }

  DocumentReference getCurrentUserDocRef() {
    return usersCollectionReference.doc(FirebaseAuth.instance.currentUser?.uid);
  }

  _firebaseAuthInsertData() async {
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

  updateDeviceToken({bool clearIt = false}) async {
    try {
      String? token;
      if (Platform.isAndroid) {
        token = await FirebaseMessaging.instance.getToken();
      } else if (Platform.isIOS) {
        token = await FirebaseMessaging.instance.getAPNSToken();
      }

      if (clearIt) {
        await getCurrentUserDocRef()
            .update({"apnToken": null, "deviceTokenList": null});
      } else {
        if (token != null) {
          if (Platform.isAndroid) {
            userModel.addNewAndroidToken(token);
            await getCurrentUserDocRef().update({
              "androidTokensList":
                  FieldValue.arrayUnion(userModel.androidTokensList)
            });
          } else if (Platform.isIOS) {
            userModel.addNewIosToken(token);
            await getCurrentUserDocRef().update({
              "appleTokensList":
                  FieldValue.arrayUnion(userModel.androidTokensList)
            });
          }
        } else {
          debugPrint("token is null");
        }
      }
    } catch (e) {
      debugPrint("updateDeviceToken failed exp ${e.toString()}");
    }
  }

  Future<UserModel?> getUserDataAndStoreLocally() async {
    if (FirebaseAuth.instance.currentUser != null) {
      DocumentSnapshot documentSnapshot = await getCurrentUserDocRef().get();
      if (documentSnapshot.data() != null) {
        userModel = UserModel.fromJson(documentSnapshot.data() as Map);
        return userModel;
      }
    }
    return null;
  }

  checkUserName() {}

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
                    debugPrint(e.toString());
                  } finally {
                    await SPHelper().clear();
                    Get.offUntil(
                        MaterialPageRoute(
                            builder: (builder) => const SplashScreen()),
                        (route) => false);
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
}
