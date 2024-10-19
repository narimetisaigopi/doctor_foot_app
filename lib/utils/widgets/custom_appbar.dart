import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color titleColor;
  final Color bgColor;
  final Color iconColor;
  const CustomAppbar(
      {
    super.key,
    this.title = "",
    this.bgColor = AppColors.primaryBlue,
    this.titleColor = AppColors.textWhiteColor,
    this.iconColor = AppColors.textWhiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ).tr(),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: iconColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54.0);
}
