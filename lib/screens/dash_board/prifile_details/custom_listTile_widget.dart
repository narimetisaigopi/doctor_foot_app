import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomListTileWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData leadingIcon;
  final bool isIconNeeded;

  const CustomListTileWidget(
      {super.key,
      required this.text,
      required this.leadingIcon,
      required this.onPressed,
      this.isIconNeeded = false});

  @override
  State<CustomListTileWidget> createState() => _CustomListTileWidgetState();
}

class _CustomListTileWidgetState extends State<CustomListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: ListTile(
          title: Text(widget.text,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textBackColor,
                fontWeight: FontWeight.w500,
              )).tr(),
          leading: CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Icon(
                widget.leadingIcon,
                color: AppColors.secondary,
              )),
          trailing: widget.isIconNeeded
              ? const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                )
              : SizedBox.shrink()),
    );
  }
}
