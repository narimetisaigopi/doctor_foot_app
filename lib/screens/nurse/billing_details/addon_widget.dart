import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AddonWidget extends StatefulWidget {
  final String titleText;
  final Function() onPress;
  const AddonWidget({
    super.key,
    required this.titleText,
    required this.onPress,
  });

  @override
  State<AddonWidget> createState() => _AddonWidgetState();
}

class _AddonWidgetState extends State<AddonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.titleText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            InkWell(
              onTap: widget.onPress,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 45, right: 45, top: 4, bottom: 4),
                  child: Text(
                    "Add",
                    style: TextStyle(
                        color: AppColors.black1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
