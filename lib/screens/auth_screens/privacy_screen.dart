import 'package:drfootapp/screens/maps/my_google_maps.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                "otpScreenTitle",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ).tr(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "introSecurity1",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ).tr(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "introSecurity2",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ).tr(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "introSecurity3",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ).tr(),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  buttonName: "acceptAndContinue",
                  onPress: () {
                    Get.offAll(() => const MyGoogleMap());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
