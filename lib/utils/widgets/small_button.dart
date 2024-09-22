import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatefulWidget {
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
  const SmallButton({
    super.key,
    this.buttonName = "",
    this.width = 125,
    this.onPress,
    this.bgColor = AppColors.primaryBlue,
    this.textColor = Colors.white,
    this.borderRadius = 6.0,
    this.enablePrefixIcon = false,
    this.prefixIcon = const Icon(Icons.abc),
    this.isBoxShadow = true,
    this.border = true,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: widget.onPress,
      child: Container(
        height: 32,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child:
                    widget.enablePrefixIcon ? widget.prefixIcon : Container(),
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
