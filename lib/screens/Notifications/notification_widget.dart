import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  final String title, subtitle, description;
  final String image;
  final TextStyle textStyle;

  const NotificationWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.textStyle,
  });

  @override
  State<NotificationWidget> createState() => _CustomnotificationState();
}

class _CustomnotificationState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.whiteBgColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child:  Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: SvgImageWidget(path: 
                  AssetsConstants.HbA1C,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.title,
                      style: widget.textStyle,
                    ),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                          color: AppColors.blackBold,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      widget.description,
                      style: const TextStyle(
                          color: AppColors.grey2,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
