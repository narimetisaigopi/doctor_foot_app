import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VideosMainWidget extends StatefulWidget {
  final String image;
  final String title;
  final Function()? onPress;
  const VideosMainWidget({
    super.key,
    required this.image,
    required this.title,
    required this.onPress,
  });

  @override
  State<VideosMainWidget> createState() => _VideosMainWidgetState();
}

class _VideosMainWidgetState extends State<VideosMainWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              child: CustomImage(
                path: widget.image,
                height: 160,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: const Text(
                  "gettingMedisineText",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textWhiteColor),
                ).tr(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 26,
                width: 120,
                decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child:  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textWhiteColor),
                  ).tr(),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
