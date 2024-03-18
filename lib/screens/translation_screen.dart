import 'package:doctor_foot_app/screens/dash_board/prifile_details/custom_listTile_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Languages",
              style: TextStyle(color: AppColors.primary),
            ),
            centerTitle: true),
        body: Column(
          children: [
            CustomListTileWidget(
                text: "Telugu",
                leadingIcon: FontAwesomeIcons.t,
                onPressed: () {
                  context.setLocale(const Locale("te"));
                  Navigator.pop(context);
                }),
            Utility.customDivider(),
            CustomListTileWidget(
                text: "Hindi",
                leadingIcon: FontAwesomeIcons.h,
                onPressed: () {
                  context.setLocale(const Locale("hi"));
                  Navigator.pop(context);
                }),
            Utility.customDivider(),
            CustomListTileWidget(
                text: "English",
                leadingIcon: FontAwesomeIcons.e,
                onPressed: () {
                  context.setLocale(const Locale("en"));
                  Navigator.pop(context);
                }),
            Utility.customDivider(),
          ],
        ));
  }
}
