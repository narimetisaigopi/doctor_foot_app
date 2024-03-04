import 'package:doctor_foot_app/screens/auth_screens/sign_up_screen.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          onPress: () {
            Utility.myBottomSheet(context,
                widget: const SignUpScreen(), heightFactor: 0.7);
          },
        ),
      ),
    );
  }
}
