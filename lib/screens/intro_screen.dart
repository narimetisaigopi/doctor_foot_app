import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: PageView.builder(
        itemCount: onBoardItems.length,
        itemBuilder: ((context, index) {
          // final allImages = onBoardItems[index];
          return Container(
            margin: EdgeInsets.only(
              top: 84,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: index == 0
                            ? Container()
                            : const SvgImageWidget(
                                path: AssetsConstants.arrow_back,
                                width: 40,
                                height: 40,
                                
                              ),
                      ),
                      Text(
                        Strings.skip,
                        style: GoogleFonts.dmSans().copyWith(
                            fontSize: 16,
                            color: AppColors.whiteTextColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Placeholder(),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        Strings.introText,
                        style: GoogleFonts.dmSans().copyWith(
                            fontSize: 24,
                            color: AppColors.whiteTextColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 108,
                        height: 8,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: onBoardItems.length,
                          itemBuilder: (ctx, i) => Container(
                            decoration: BoxDecoration(
                                color: index == i
                                    ? AppColors.white_1
                                    : Colors.white24,
                                borderRadius: BorderRadius.circular(0)),
                            width: index == i ? 40 : 25,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
