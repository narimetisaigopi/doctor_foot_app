import 'dart:async';

import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
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
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  Timer? _timer;
  int _timerSeconds = 60;

  String otp = "";

  void startTimer() {
    _timerSeconds = 60;
    const oneSec = Duration(seconds: 1);
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timerSeconds == 0) {
          timer.cancel();
        } else {
          setState(() {
            _timerSeconds--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
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
          border: Border.all(color: AppColors.grey4),
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
      backgroundColor: AppColors.whiteBgColor,
      body: GetBuilder<AuthenticationController>(
          builder: (authenticationController) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      Strings.verificationString,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ).tr(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          Strings.otpString,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                          textAlign: TextAlign.start,
                        ).tr(),
                        const Text(
                          Strings.changeNumber,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.primaryBlue,
                          ),
                          textAlign: TextAlign.start,
                        ).tr(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Pinput(
                      onChanged: (value) {
                        otp = value;
                      },
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Didn’t receive the OTP?",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                          textAlign: TextAlign.start,
                        ).tr(),
                        InkWell(
                          onTap: _timerSeconds == 0
                              ? authenticationController
                                  .firebaseSendOTP(context)
                              : null,
                          child: Text(
                            _timerSeconds == 0 ? 'Resent' : '00:$_timerSeconds',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    authenticationController.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            buttonName: "verifyOtp",
                            onPress: () {
                              if (otp.length == 6) {
                                authenticationController.firebaseVerifyOTP(otp);
                              } else {
                                Utility.toast(Strings.enterOTP);
                              }
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
}
