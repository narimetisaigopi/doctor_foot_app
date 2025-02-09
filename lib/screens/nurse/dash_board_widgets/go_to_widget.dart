import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class GoToWidget extends StatefulWidget {
  final String text;
  final Function() onPress;
  const GoToWidget({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  State<GoToWidget> createState() => _GoToWidgetState();
}

class _GoToWidgetState extends State<GoToWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: AppColors.secondaryColor,
        )),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                widget.text,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.blackBold,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(
                size: 16,
                Icons.arrow_forward_ios,
                color: AppColors.blackBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
