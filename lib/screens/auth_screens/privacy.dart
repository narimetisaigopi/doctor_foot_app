import 'package:doctor_foot_app/screens/auth_screens/current_location_screen.dart';
import 'package:doctor_foot_app/screens/risk_factor_home.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValuePrivacy extends StatefulWidget {
  const ValuePrivacy({super.key});

  @override
  State<ValuePrivacy> createState() => _ValuePrivacyState();
}

class _ValuePrivacyState extends State<ValuePrivacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: double.infinity,
        child: Column(
          children: [
            // SVG IMAGES ERROR - ADDED THIS LINE FOR FUTURE USE
            // SvgImageWidget(path: AssetsConstants.intro_lock_Icon),
            const Icon(
              Icons.lock_outlined,
              size: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              Strings.otpScreenTitle,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              Strings.introSecurity1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              Strings.introSecurity2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              Strings.introSecurity3,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                buttonName: Strings.acceptAndContinue,
                onPress: () {
                  Utility.myBottomSheet(context,
                      widget: const RiskFactorHome(), heightFactor: 0.6);
                })
          ],
        ),
      ),
    );
  }
}
