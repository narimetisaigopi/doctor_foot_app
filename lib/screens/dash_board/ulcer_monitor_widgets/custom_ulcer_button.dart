import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class CustomUlcerButton extends StatefulWidget {
  final Function() onPressed;
  const CustomUlcerButton({super.key, required this.onPressed});

  @override
  State<CustomUlcerButton> createState() => _CustomUlcerButtonState();
}

class _CustomUlcerButtonState extends State<CustomUlcerButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Center(
          child: Container(
            height: 44,
            width: 318,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16)),
            child: Center(
                child: const Text(
              "getStartedButton",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textWhiteColor,
                  fontWeight: FontWeight.w700),
            ).tr()),
          ),
        ),
      ),
    );
  }
}
