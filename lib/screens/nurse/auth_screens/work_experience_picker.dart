import 'package:flutter/material.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';

class WorkExperiencePicker extends StatefulWidget {
  final Function(int, int) onChanged;
  const WorkExperiencePicker({super.key, required this.onChanged});

  @override
  State<WorkExperiencePicker> createState() => _WorkExperiencePickerState();
}

class _WorkExperiencePickerState extends State<WorkExperiencePicker> {
  int years = 0;
  int months = 0;

  void _incrementYears() {
    setState(() {
      years++;
    });
    widget.onChanged(years, months);
  }

  void _decrementYears() {
    if (years > 0) {
      setState(() {
        years--;
      });
    }
    widget.onChanged(years, months);
  }

  void _incrementMonths() {
    setState(() {
      months++;
      if (months >= 12) {
        months = 0;
        years++;
      }
    });
    widget.onChanged(years, months);
  }

  void _decrementMonths() {
    if (months > 0) {
      setState(() {
        months--;
      });
    } else if (years > 0) {
      setState(() {
        years--;
        months = 11;
      });
    }
    widget.onChanged(years, months);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Years picker
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.grey),
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: [
                  Text(
                    "$years",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: AppColors.black2,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _incrementYears,
                        child: const Icon(Icons.arrow_drop_up, size: 22),
                      ),
                      GestureDetector(
                        onTap: _decrementYears,
                        child: const Icon(Icons.arrow_drop_down, size: 22),
                      ),
                    ],
                  ),
                  const VerticalDivider(),
                  const Text(
                    "Years",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.blackBold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Months picker
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.grey),
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: [
                  Text(
                    "$months",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: AppColors.black2,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _incrementMonths,
                        child: const Icon(Icons.arrow_drop_up, size: 22),
                      ),
                      GestureDetector(
                        onTap: _decrementMonths,
                        child: const Icon(Icons.arrow_drop_down, size: 22),
                      ),
                    ],
                  ),
                  const VerticalDivider(),
                  const Text(
                    "Months",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.blackBold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
