import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => mobileAdminLogin(),
        desktop: (BuildContext context) => desktopAdminLogin(),
      ),
    );
  }

  Widget mobileAdminLogin() {
    return Container();
  }

  Widget desktopAdminLogin() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.grey.shade300)
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Admin Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  labelNeeded: true,
                  label: Strings.emailIdTextFieldFocusLabel,
                  hint: Strings.emailIdTextFieldFocusLabel,
                  textEditingController:
                      _authenticationController.emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  labelNeeded: true,
                  label: "Password",
                  hint: "Password",
                  textEditingController:
                      _authenticationController.passwordController,
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  buttonName: Strings.signInText,
                  onPress: () => _authenticationController.signInwithEmail(
                    _authenticationController.emailController.text,
                    _authenticationController.passwordController.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
