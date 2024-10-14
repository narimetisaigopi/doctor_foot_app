import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  final String text;
  final Function(String) onSelected;
  final bool isSelected;
  const GenderWidget(
      {super.key,
      required this.text,
      required this.onSelected,
      this.isSelected = false});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onSelected(widget.text);
      },
      child: Container(
        decoration: BoxDecoration(
            color: widget.isSelected
                ? AppColors.primaryBlue
                : AppColors.bookSumBorder.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color:
                  widget.isSelected ? AppColors.bookSumBorder : AppColors.grey,
            )),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 18,
              color: widget.isSelected
                  ? AppColors.whiteBgColor
                  : AppColors.bookSumBorder,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
