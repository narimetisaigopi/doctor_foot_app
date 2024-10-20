import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RateAndBookingButton extends StatefulWidget {
  final String buttonName;
  final IconData? icon;
  final double borderRadius;
  final Function()? onPress;
  final Color bgColor;
  final Color iconColor;
  final Color textColor;
  final bool isIconNeeded;
  final double fontSize;

  const RateAndBookingButton({
    super.key,
    this.buttonName = "",
    this.icon = Icons.done,
    this.onPress,
    this.bgColor = AppColors.primaryBlue,
    this.iconColor = AppColors.primaryBlue,
    this.textColor = AppColors.whiteBgColor,
    this.borderRadius = 8,
    this.isIconNeeded = false,
    this.fontSize = 12,
  });

  @override
  State<RateAndBookingButton> createState() => _RateAndBookingButtonState();
}

class _RateAndBookingButtonState extends State<RateAndBookingButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: widget.onPress,
      child: Container(
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.isIconNeeded
                  ? Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Icon(
                        widget.icon,
                        size: 16,
                        color: widget.iconColor,
                      ),
                    )
                  : Container(),
              const SizedBox(
                width: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  widget.buttonName,
                  style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: widget.fontSize,
                  ),
                ).tr(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
