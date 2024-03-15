import 'package:doctor_foot_app/screens/dash_board/prifile_details/custom_listTile_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/custom_sizedBox_widget.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Divider customDivider = const Divider(
    height: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text(Strings.profile),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.secondary, width: 2)),
              height: 124,
              width: 124,
              child: const SvgImageWidget(path: AssetsConstants.profile_image),
            ),
            const CustomSizedBox(
              height: 08,
            ),
            const Text(
              Strings.profileName,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textBackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const CustomSizedBox(
              height: 08,
            ),
            const Text(
              Strings.regd,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textBackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const CustomSizedBox(
              height: 30,
            ),
            customDivider,
            CustomListTileWidget(
                text: Strings.myProfile,
                leadingIcon: Icons.person,
                onPressed: () {}),
            customDivider,
            CustomListTileWidget(
                text: Strings.appointment,
                leadingIcon: Icons.calendar_month,
                onPressed: () {}),
            customDivider,
            CustomListTileWidget(
                text: Strings.service,
                leadingIcon: Icons.calendar_month,
                onPressed: () {}),
            customDivider,
            CustomListTileWidget(
                text: Strings.payments,
                leadingIcon: Icons.calendar_month,
                onPressed: () {}),
            customDivider,
            CustomListTileWidget(
                text: Strings.orders,
                leadingIcon: Icons.calendar_month,
                onPressed: () {}),
            customDivider,
            CustomListTileWidget(
                text: Strings.contactus,
                leadingIcon: Icons.call,
                onPressed: () {}),
            customDivider,
            CustomListTileWidget(
                text: Strings.logout,
                leadingIcon: Icons.logout,
                onPressed: () {}),
            customDivider,
          ],
        ),
      ),
    );
  }
}
