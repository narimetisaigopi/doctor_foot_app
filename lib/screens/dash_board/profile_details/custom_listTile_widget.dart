import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomListTileWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData leadingIcon;

  const CustomListTileWidget(
      {super.key,
      required this.text,
      required this.leadingIcon,
      required this.onPressed});

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
              color: AppColors.textBlackColors,
              fontWeight: FontWeight.w500,
            )).tr(),
        leading: CircleAvatar(
            backgroundColor: AppColors.primary,
            child: Icon(
              widget.leadingIcon,
              color: AppColors.secondary,
            )),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
      ),
    );
  }
}
