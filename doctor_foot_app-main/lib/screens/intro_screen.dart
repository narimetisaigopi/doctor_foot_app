import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var onBoardItems = [
    AssetsConstants.intro_1,
    AssetsConstants.intro_2,
    AssetsConstants.intro_3,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: PageView.builder(
            itemCount: onBoardItems.length,
            itemBuilder: ((context, index) {
              final allImages = onBoardItems[index];
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: index == 0
                              ? Container()
                              : const SvgImageWidget(
                                  path: AssetsConstants.arrow_back,
                                ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            Strings.skip,
                            style: TextStyle(
                                color: AppColors.textColor, fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    
                    // const SvgImageWidget(
                     
                    //   path: AssetsConstants.intro_1,
                    // ),
                  
                    SvgPicture.asset(allImages,color: Colors.black,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          Strings.introText,
                          style: TextStyle(
                              fontSize: 32, color: AppColors.textColor),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 10, 
                          child: ListView.builder(
                            padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                            scrollDirection: Axis.horizontal,
                            itemCount: onBoardItems.length,
                            itemBuilder: (context, i) => Container(
                              decoration: BoxDecoration(
                                  color: index == i
                                      ? Colors.white70
                                      : Colors.white24,
                                  borderRadius: BorderRadius.circular(5)),
                              width: index == i ? 40 : 25,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            })));
  }
}

