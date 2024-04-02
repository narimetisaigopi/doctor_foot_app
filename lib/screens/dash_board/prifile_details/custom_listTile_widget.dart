import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomListTileWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData leadingIcon;
  final bool isIconNeeded;
  final bool isSelected; // New property to determine if the item is selected
  final IconData? trailingIcon;

  const CustomListTileWidget({
    Key? key,
    required this.text,
    required this.leadingIcon,
    required this.onPressed,
    this.isIconNeeded = false,
    this.isSelected = false, // Default to false
    this.trailingIcon = Icons.arrow_forward_ios,
  }) : super(key: key);

  @override
  State<CustomListTileWidget> createState() => _CustomListTileWidgetState();
}

class _CustomListTileWidgetState extends State<CustomListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: ListTile(
        title: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.textBlackColors,
            fontWeight: FontWeight.w500,
          ),
        ).tr(),
        leading: widget.isIconNeeded
            ? CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  widget.leadingIcon,
                  color: AppColors.secondary,
                ),
              )
            : null,
        trailing: widget.isSelected
            ? const Icon(Icons.check, color: Colors.green)
            : widget.isIconNeeded
                ? Icon(widget.trailingIcon)
                : null,
      ),
    );
  }
}
