import 'package:drfootapp/controllers/nurse/nurse_auth_controller.dart';
import 'package:drfootapp/screens/nurse/auth_screens/nurse_signup_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../utils/constants/string_constants.dart';

class NurseLoginScreen extends StatefulWidget {
  const NurseLoginScreen({super.key});

  @override
  State<NurseLoginScreen> createState() => _NurseLoginScreenState();
}

class _NurseLoginScreenState extends State<NurseLoginScreen> {
  final pageController = PageController();
  double currentPage = 0;
  final _formKey = GlobalKey<FormBuilderState>();

  final FocusNode _focusNode = FocusNode();

  bool enableSendOTP = false;

  NurseAuthController nurseAuthController = Get.put(NurseAuthController());

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 70,
              child: Image.asset(
                AssetsConstants.nurse_intro,
              ),
            ),
            Expanded(
              flex: 30,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Let’s get started!",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.blackBold,
                          fontWeight: FontWeight.w500,
                        ),
                      ).tr(),
                      const SizedBox(height: 12),
                      // InkWell(
                      //   onTap: () {
                      //     // Utility.myBottomSheet(
                      //     //   context,
                      //     //   widget: const SignInScreen(),
                      //     //   heightFactor: 0.45,
                      //     // );
                      //   },
                      //   child: Container(
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(8),
                      //         border: Border.all(
                      //           color: AppColors.grey2,
                      //           width: 1,
                      //         )),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(12.0),
                      //       child: const Text(
                      //         "Enter mobile number",
                      //         style: TextStyle(
                      //           fontSize: 18,
                      //           color: AppColors.grey,
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ).tr(),
                      //     ),
                      //   ),
                      // ),

                      MyTextField(
                        hint: _focusNode.hasFocus
                            ? Strings.mobileTextFieldFocusHint
                            : Strings.mobileTextFieldHint,
                        textEditingController:
                            nurseAuthController.mobileNumberController,
                        labelNeeded: false,
                        maxLength: 10,
                        prefixIcon: Container(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: const Text(
                            "+91 ",
                            style: TextStyle(
                                color: AppColors.black1, fontSize: 17),
                          ),
                        ),
                        onChanged: (p0) {
                          if (p0 != null && p0.length >= 10) {
                            enableSendOTP = true;
                          } else {
                            enableSendOTP = false;
                          }
                          setState(() {});
                          return null;
                        },
                        textInputType: TextInputType.phone,
                        onSubmited: (value) {
                          validate();
                        },
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.maxLength(10),
                            FormBuilderValidators.minLength(10),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: nurseAuthController.isLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                bgColor: enableSendOTP
                                    ? AppColors.primaryBlue
                                    : AppColors.sentOtpBg,
                                textColor: enableSendOTP
                                    ? AppColors.whiteBgColor
                                    : AppColors.sentOtptextColor,
                                buttonName: "sendOtpText",
                                onPress: validate,
                              ),
                      ),
                      Row(
                        children: [
                          const Text("If you don't have a account !"),
                          InkWell(
                            onTap: () {
                              Utility.myBottomSheet(
                                context,
                                widget: const NurseSignUpScreen(),
                                heightFactor: 0.75,
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  validate() {
    Utility().closeKeyboard();
    bool status = _formKey.currentState?.saveAndValidate() ?? false;
    if (status) {
      nurseAuthController.signIn(context);
    }
  }
}
