import 'dart:async';

import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/screens/auth_screens/privacy.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../utils/constants/string_constants.dart';
import '../../utils/widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  bool isLoading = false;

  Timer? _timer;
  int _start = 30;

  void startTimer() {
    _start = 60;
    const oneSec = Duration(seconds: 1);
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _authenticationController.otpController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  sendOtpAndStartTimer() async {
    await _authenticationController.firebaseSendOTP();
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    _authenticationController.otpController = TextEditingController();
    sendOtpAndStartTimer();
  }

  @override
  Widget build(BuildContext context) {
    final PinTheme defaultPinTheme = PinTheme(
      width: 52,
      height: 52,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 2),
                blurRadius: 10,
                color: Colors.grey.shade100),
          ]),
    );

    final PinTheme focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(10),
    );

    final PinTheme submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "verificationString",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ).tr(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: RichText(
                    text: TextSpan(
                      text: Strings.otpString,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                      children: [
                        TextSpan(
                            text: _authenticationController
                                .mobileNumberController.text),
                        const TextSpan(
                            text: Strings.changeNumber,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Pinput(
                  controller: _authenticationController.otpController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  length: 6,
                ),
                const SizedBox(
                  height: 20,
                ),
                _start > 0
                    ? TextButton(
                        onPressed: () {},
                        child: Text(
                          'Retry OTP in $_start seconds',
                          style: TextStyle(color: AppColors.primary),
                        ))
                    : TextButton(
                        onPressed: () {
                          sendOtpAndStartTimer();
                        },
                        child: const Text(
                          'Resend OTP',
                          style: TextStyle(color: AppColors.primary),
                        )),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonName: "verifyOtp",
                  onPress: () {
                    validateOtp();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  validateOtp() async {
    setState(() {
      isLoading = true;
    });

    try {
      if (_authenticationController.otpController.text.isEmpty) {
        Utility.toast("Invalid OTP", backgroundColor: Colors.red);
      } else if (_authenticationController.otpController.text.length < 6) {
        Utility.toast("Enter 6 digits Otp", backgroundColor: Colors.red);
      } else {
        print(_authenticationController.otpController.text);
        _authenticationController.smsCode =
            _authenticationController.otpController.text;
        await _authenticationController
            .firebaseVerifyOTP(_authenticationController.otpController.text);
        Utility.myBottomSheet(context,
            widget: const ValuePrivacy(), heightFactor: 0.7);
      }
    } catch (error) {
      print("Error during OTP verification: $error");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
