import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';

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
        child: const Column(
          children: [
            // SVG IMAGES ERROR - ADDED THIS LINE FOR FUTURE USE
            // SvgImageWidget(path: AssetsConstants.intro_lock_Icon),
            Icon(
              Icons.lock_outlined,
              size: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Strings.otpScreenTitle,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Strings.introSecurity1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              Strings.introSecurity2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              Strings.introSecurity3,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              buttonName: Strings.acceptAndContinue,
            )
          ],
        ),
      ),
    );
  }
}
