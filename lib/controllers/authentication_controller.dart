// ignore_for_file: unused_field, use_build_context_synchronously
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/admin/admin_panel.dart';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/user_model.dart';
import 'package:drfootapp/screens/auth_screens/otp_screen.dart';
import 'package:drfootapp/screens/auth_screens/privacy.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/splash_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/sp_helper.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

UserModel loginUserModel = UserModel();

class AuthenticationController extends GetxController {
  String _verificationId = "";
  bool isLoading = false;
  int? forceResendingToken;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? smsCode;

  bool isSignUp = true;

  int selectedGenderIndex = -1;

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

  late BuildContext context;

  // this method is used to send otp to user .
  firebaseSendOTP(BuildContext context) async {
    _updateLoading(true);
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
      _updateLoading(false);
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
      _updateLoading(true);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(authCredential);
      if (userCredential.user != null) {
        if (isSignUp) {
          // if login taking directly to dashboard
          await _firebaseAuthInsertData();
          Utility.myBottomSheet(context,
              widget: const ValuePrivacy(), heightFactor: 0.7);
        } else {
          await getUserDataAndStoreLocally();
          // if login taking directly to sign up
          await updateDeviceToken();
          Get.offAll(() => const DashBoardScreen());
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
      logger("message $e");
      logger("message $stack");
      Utility.toast("$e", backgroundColor: Colors.red);
    }
  }

  DocumentReference getCurrentUserDocRef() {
    return usersCollectionReference.doc(FirebaseAuth.instance.currentUser?.uid);
  }

  _firebaseAuthInsertData() async {
    try {
      UserModel userModel = UserModel();
      userModel.userName = userNameController.text;
      userModel.mobileNumber = userModel.mobileNumber;
      userModel.docId = getCurrentUserDocRef().id;
      userModel.dateOfBirth = dateOfBirthController.text;
      userModel.gender = genderController.text;
      userModel.timestamp = DateTime.now();
      await getCurrentUserDocRef().set(userModel.toMap());
      await updateDeviceToken();
    } catch (e) {
      logger(e.toString());
    }
  }

  Future<void> signInwithEmail(String email, String password) async {
    try {
      logger(email);
      logger(password);
      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => const AdminPanel());
    } catch (e) {
      logger(e.toString());
    }
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

  signUpFirebaseValidation(BuildContext context) async {
    try {
      _updateLoading(true);
      bool userNameStatus = await isUsernameExisted();
      if (!userNameStatus) {
        Utility.toast("Username already taken, please enter another username");
        return;
      }
      bool mobileNumberStatus = await isMobileExisted();
      if (!mobileNumberStatus) {
        Utility.toast("Mobile number already register, please login");
        return;
      }
      await firebaseSendOTP(context);
    } catch (e) {
      Utility.toast("Signup failed $e");
      logger(e.toString());
    } finally {
      _updateLoading(false);
    }
  }

  signInFirebaseValidation(BuildContext context) async {
    try {
      _updateLoading(true);
      bool mobileNumberStatus = await isMobileExisted();
      if (mobileNumberStatus) {
        Utility.toast("Mobile number not registered, please create account");
        return;
      }
      await firebaseSendOTP(context);
    } catch (e) {
      logger(e.toString());
    } finally {
      _updateLoading(false);
    }
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

  editProfile() async {
    try {
      _updateLoading(true);
      UserModel userModel = UserModel();
      userModel.emailId = emailController.text;
      userModel.dateOfBirth = dateOfBirthController.text;
      userModel.gender = genderController.text;
      userModel.bloodgroup = bloodGroupController.text;
      userModel.height = heightController.text;
      userModel.weight = weightController.text;
      await usersCollectionReference
          .doc(Utility().getCurrentUserId())
          .update(userModel.toUpdateMap());
      await getUserDataAndStoreLocally();
      Utility.toast("Updated profile successfully.");
      Get.back();
    } catch (e) {
      Utility.toast("Failed to update ${e.toString()}");
    } finally {
      _updateLoading(false);
    }
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

  uploadProfilePic(XFile xfile) async {
    String image = await Get.put(FirebaseStorageController())
        .uploadImageToFirebase(
            directoryName: storageProfile,
            fileName: Utility().getCurrentUserId(),
            uploadFile: xfile);
    if (image.isNotEmpty) {
      loginUserModel.profilePic = image;
    }
    update();
    Utility.toast("Profile pic uploaded successfully.");
  }
}
