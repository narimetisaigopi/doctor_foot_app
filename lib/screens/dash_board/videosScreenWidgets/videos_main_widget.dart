import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VideosMainWidget extends StatefulWidget {
  final String image;
  const VideosMainWidget({super.key, required this.image});

  @override
  State<VideosMainWidget> createState() => _VideosMainWidgetState();
}

class _VideosMainWidgetState extends State<VideosMainWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            height: size.height * 0.21,
            width: double.infinity,
            child: SizedBox(
              child: SvgImageWidget(
                path: widget.image,
                height: size.height * 0.2,
                width: size.width * 0.8,
              ),
            ),
          ),
        ),
        Positioned(
          top: 26,
          left: 26,
          child: Column(
            children: [
              const Text(
                "gettingMedisineText",
                style: TextStyle(
                    fontSize: 22,
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
                    borderRadius: BorderRadius.circular(16)),
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
