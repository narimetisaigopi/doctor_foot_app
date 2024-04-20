import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
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
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Contact Us",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
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
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary),
            ),
            const SvgImageWidget(
              height: 260,
              path: AssetsConstants.dr_consult,
            ),
            const SizedBox(
              height: 22,
            ),
            CustomButton(
              bgColor: AppColors.contactPageBtnColor,
              buttonName: "+91 91234566780",
              tColor: AppColors.primary,
              isBoxShadow: false,
              onPress: () {},
            ),
            const SizedBox(
              height: 22,
            ),
            CustomButton(
              bgColor: AppColors.contactPageBtnColor,
              buttonName: "support@gmail.com",
              tColor: AppColors.primary,
              isBoxShadow: false,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
