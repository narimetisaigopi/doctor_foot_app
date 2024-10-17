import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomListTileWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final String leadingIcon;
  final bool isIconNeeded;
  final bool isSelected; // New property to determine if the item is selected
  final IconData? trailingIcon;

  const CustomListTileWidget({
    super.key,
    required this.text,
    required this.leadingIcon,
    required this.onPressed,
    this.isIconNeeded = false,
    this.isSelected = false, // Default to false
    this.trailingIcon = Icons.arrow_forward_ios,
  });

  @override
  State<CustomListTileWidget> createState() => _CustomListTileWidgetState();
}

class _CustomListTileWidgetState extends State<CustomListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Column(
        children: [
          ListTile(
              title: Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.profileTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ).tr(),
              leading: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(
                      widget.leadingIcon,
                      height: 22,
                      width: 22,
                    )),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey,
                size: 22,
              )),
          const Divider(
            color: AppColors.deviderColor,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
