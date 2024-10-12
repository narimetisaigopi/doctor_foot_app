import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Contact Us",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            CustomImage(
              path: AssetsConstants.contact_us_image,
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 22,
            ),
            CustomButton(
              bgColor: AppColors.contactPageBtnColor,
              buttonName: "+91 91234566780",
              textColor: AppColors.primaryBlue,
              isBoxShadow: false,
              prefixIcon: const Icon(
                Icons.phone_in_talk,
                size: 32,
                color: AppColors.primaryBlue,
              ),
              enablePrefixIcon: true,
              onPress: () {},
            ),
            const SizedBox(
              height: 22,
            ),
            CustomButton(
              bgColor: AppColors.contactPageBtnColor,
              buttonName: "support@gmail.com",
              textColor: AppColors.primaryBlue,
              isBoxShadow: false,
              onPress: () {},
              prefixIcon: const Icon(
                size: 32,
                Icons.mail_outlined,
                color: AppColors.primaryBlue,
              ),
              enablePrefixIcon: true,
            ),
          ],
        ),
      ),
    );
  }
}
