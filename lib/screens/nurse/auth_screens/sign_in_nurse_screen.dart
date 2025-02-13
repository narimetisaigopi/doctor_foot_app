import 'package:drfootapp/controllers/nurse/nurse_auth_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class SignInNurseScreen extends StatefulWidget {
  const SignInNurseScreen({super.key});

  @override
  State<SignInNurseScreen> createState() => _SignInNurseScreenState();
}

class _SignInNurseScreenState extends State<SignInNurseScreen> {
  final FocusNode _focusNode = FocusNode();

  final NurseAuthController _nurseAuthController =
      Get.put(NurseAuthController());
  final _formKey = GlobalKey<FormBuilderState>();
  bool enableSendOTP = false;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NurseAuthController>(builder: (nurseAuthController) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: FormBuilder(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Let’s get started!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black2,
                      ),
                    ).tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      hint: _focusNode.hasFocus
                          ? Strings.mobileTextFieldFocusHint
                          : Strings.mobileTextFieldHint,
                      textEditingController:
                          _nurseAuthController.mobileNumberController,
                      labelNeeded: false,
                      maxLength: 10,
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: const Text(
                          "+91 ",
                          style:
                              TextStyle(color: AppColors.black1, fontSize: 17),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
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
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  validate() {
    Utility().closeKeyboard();
    bool status = _formKey.currentState?.saveAndValidate() ?? false;
    if (status) {
    } else {}
  }
}
