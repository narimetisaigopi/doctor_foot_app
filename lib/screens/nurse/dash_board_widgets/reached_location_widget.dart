import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/small_button.dart';
import 'package:flutter/material.dart';

class ReachedLocationWidget extends StatefulWidget {
  final Function() onPress;
  const ReachedLocationWidget({
    super.key,
    required this.onPress,
  });

  @override
  State<ReachedLocationWidget> createState() => _ReachedLocationWidgetState();
}

class _ReachedLocationWidgetState extends State<ReachedLocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 0.5,
            color: AppColors.grey2,
          )),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AssetsConstants.michell_ross,
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "You have reached Client  \nlocation in 24mins",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.phone_in_talk,
                    size: 32,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.searchButtonColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 32,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Your at the location",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black2,
                          ),
                        ),
                      ],
                    ),
                    SmallButton(
                      buttonName: "Reached",
                      bgColor: AppColors.primary,
                      onPress: widget.onPress,
                      isBoxShadow: true,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
