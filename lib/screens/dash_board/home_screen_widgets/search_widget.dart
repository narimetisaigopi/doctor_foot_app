import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String url;
  final String title;

  const SearchWidget({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.whiteBgColor,
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
             Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: SvgImageWidget(
                    height: 48,
                    width: 48,
                    path: widget.url,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
                flex: 8,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        color: AppColors.blackBold,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
