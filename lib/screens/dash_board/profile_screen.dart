import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,top: 16,right: 16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color:AppColors.secondary,width: 2)),
              height: 124,
              width: 124,
              child: const SvgImageWidget(path: AssetsConstants.profile_image),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              Strings.profileName,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textBackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              Strings.regd,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textBackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Divider(
              height: 50,
            ),
            const ListTile(
              title: Text(Strings.myProfile,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textBackColor,
                    fontWeight: FontWeight.w500,
                  )),
              leading: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.person,
                    color: AppColors.secondary,
                  )),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            customDivider,
            const ListTile(
              title: Text(Strings.appointment,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textBackColor,
                    fontWeight: FontWeight.w500,
                  )),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.calendar_month,
                  color: AppColors.secondary,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            customDivider,
            const ListTile(
              title: Text(
                Strings.service,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.calendar_month,
                  color: AppColors.secondary,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            customDivider,
            const ListTile(
              title: Text(
                Strings.payments,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.calendar_month,
                  color: AppColors.secondary,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),customDivider,
            const ListTile(
              title: Text(
                Strings.orders,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.calendar_month,
                  color: AppColors.secondary,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            customDivider,
            const ListTile(
              title: Text(
                Strings.contactus,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.call,
                  color: AppColors.secondary,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            customDivider,
            const ListTile(
              title: Text(
                Strings.logout,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.logout,
                  color: AppColors.secondary,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            customDivider,
          ],
        ),
      ),
    );
  }
}
