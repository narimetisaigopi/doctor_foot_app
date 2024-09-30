// ignore: file_names
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String buttonName;
  final double width;
  final double borderRadius;
  final Function()? onPress;
  final Color bgColor;
  final Icon prefixIcon;
  final bool isBoxShadow;
  final Color textColor;
  final bool enablePrefixIcon;
  final bool border;
  const CustomButton(
      {super.key,
      this.buttonName = "",
      this.width = 350,
      this.onPress,
      this.bgColor = AppColors.primaryBlue,
      this.textColor = Colors.white,
      this.borderRadius = 6.0,
      this.enablePrefixIcon = false,
      this.prefixIcon = const Icon(Icons.abc),
      this.isBoxShadow = true,
      this.border = true});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: widget.onPress,
      child: Container(
        height: 50,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.bgColor,
          // boxShadow: [
          //   widget.isBoxShadow
          //       ? BoxShadow(
          //           color: Colors.grey.shade400,
          //           blurRadius: 8,
          //           blurStyle: BlurStyle.outer,
          //           offset: const Offset(1, 2),
          //         )
          //       : const BoxShadow()
          // ],
          // border: widget.border
          //     ? Border.all(color: AppColors.primary, width: 1)
          //     : null,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12
                ),
                child: widget.enablePrefixIcon ? widget.prefixIcon : Container(),
              ),
              Text(
                widget.buttonName,
                style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ).tr(),
            ],
          ),
        ),
      ),
    ));
  }
}
