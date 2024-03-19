import 'package:doctor_foot_app/controllers/translation_controller.dart';
import 'package:doctor_foot_app/screens/dash_board/prifile_details/custom_listTile_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TranslationScreen extends StatefulWidget {
  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  final TranslationController translationController =
      Get.put(TranslationController());

  @override
  void initState() {
    translationController.loadSelectedLanguage();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Languages",
          style: TextStyle(color: AppColors.primary),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<TranslationController>(builder: (translationController) {
        return Column(
          children: [
            CustomListTileWidget(
              text: "Telugu",
              leadingIcon: FontAwesomeIcons.t,
              isSelected: translationController.selectedLanguage == "te",
              trailingIcon: translationController.selectedLanguage == "te"
                  ? Icons.check
                  : null,
              onPressed: () async {
                await translationController.saveSelectedLanguage("te");
                context.setLocale(const Locale("te"));
                Navigator.pop(context);
              },
            ),
            Utility.customDivider(),
            CustomListTileWidget(
              text: "Hindi",
              leadingIcon: FontAwesomeIcons.h,
              isSelected: translationController.selectedLanguage == "hi",
              trailingIcon: translationController.selectedLanguage == "hi"
                  ? Icons.check
                  : null,
              onPressed: () async {
                await translationController.saveSelectedLanguage("hi");
                context.setLocale(const Locale("hi"));
                Navigator.pop(context);
              },
            ),
            Utility.customDivider(),
            CustomListTileWidget(
              text: "English",
              leadingIcon: FontAwesomeIcons.e,
              isSelected: translationController.selectedLanguage == "en",
              trailingIcon: translationController.selectedLanguage == "en"
                  ? Icons.check
                  : null,
              onPressed: () async {
                await translationController.saveSelectedLanguage("en");
                context.setLocale(const Locale("en"));
                Navigator.pop(context);
              },
            ),
            Utility.customDivider(),
          ],
        );
      }),
    );
  }
}
