import 'package:drfootapp/controllers/nurse/nurse_auth_controller.dart';
import 'package:drfootapp/screens/nurse/nurse_dash_board_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nurse_signup_form_component.dart';

class NurseEducationDetailsSignupScreen extends StatefulWidget {
  const NurseEducationDetailsSignupScreen({super.key});

  @override
  State<NurseEducationDetailsSignupScreen> createState() =>
      _NurseEducationDetailsSignupScreenState();
}

class _NurseEducationDetailsSignupScreenState
    extends State<NurseEducationDetailsSignupScreen> {
  final NurseAuthController _nurseAuthController =
      Get.put(NurseAuthController());

  /// Returns a list of NurseSignupFormComponent widgets based on the degree.
  List<Widget> _buildComponents(String degree) {
    switch (degree) {
      case Strings.mscNursing:
        return const [
          NurseSignupFormComponent(type: Strings.mscNursingText),
          NurseSignupFormComponent(type: Strings.bscNursingText),
          NurseSignupFormComponent(
              type: Strings.gnmGeneralNursingAndMidwiefery),
          NurseSignupFormComponent(
              type: Strings.anmAuxiliaryNurseAndMidwife, showBorder: false),
        ];
      case Strings.bscNursing:
        return const [
          NurseSignupFormComponent(type: Strings.bscNursingText),
          NurseSignupFormComponent(
              type: Strings.gnmGeneralNursingAndMidwiefery),
          NurseSignupFormComponent(
              type: Strings.anmAuxiliaryNurseAndMidwife, showBorder: false),
        ];
      case Strings.gnm:
        return const [
          NurseSignupFormComponent(
              type: Strings.gnmGeneralNursingAndMidwiefery),
          NurseSignupFormComponent(
              type: Strings.anmAuxiliaryNurseAndMidwife, showBorder: false),
        ];
      case Strings.anm:
        return const [
          NurseSignupFormComponent(
              type: Strings.anmAuxiliaryNurseAndMidwife, showBorder: false),
        ];
      default:
        return [];
    }
  }

  @override
  void initState() {
    _nurseAuthController.degreeController.text = Strings.anm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final degree = _nurseAuthController.degreeController.text;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.whiteBgColor,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        title: const Text(
          "Fill Education Details",
          style: TextStyle(
            color: AppColors.whiteBgColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ).tr(),
        centerTitle: true,
      ),
      backgroundColor: AppColors.bgColor,
      body: GetBuilder<NurseAuthController>(
        builder: (nurseAuthController) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Check if a degree is selected, then display the corresponding form components.
                  if (degree.isNotEmpty)
                    Column(
                      children: _buildComponents(degree),
                    ),
                  const SizedBox(height: 20),
                  CustomButton(buttonName: "Next", onPress: validate),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void validate() {
    Utility().closeKeyboard();
    final bool status =
        nursingEducationDetailsFormKey.currentState?.saveAndValidate() ?? false;
    if (status) {
      Utility.showAlertDialogger(
        context: context,
        yes: () {
          Get.back();
          Get.offAll(() => const NurseDashBoardScreen());
        },
        no: () {
          Get.back();
        },
      );
    }
  }
}
