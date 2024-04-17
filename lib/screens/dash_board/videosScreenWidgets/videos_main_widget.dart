import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VideosMainWidget extends StatefulWidget {
  final String image;
  final Function()? onPress;
  const VideosMainWidget({super.key, required this.image, required this.onPress});

  @override
  State<VideosMainWidget> createState() => _VideosMainWidgetState();
}

class _VideosMainWidgetState extends State<VideosMainWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Stack(children: [
        Center(
          child: SizedBox(
            child: SvgImageWidget(
              path: widget.image,
              height: 170,
              width: double.infinity,
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: Column(
            children: [
              const Text(
                "gettingMedisineText",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textWhiteColor),
              ).tr(),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 26,
                width: 120,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: const Text(
                    "watchNowText",
                    style: TextStyle(
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
