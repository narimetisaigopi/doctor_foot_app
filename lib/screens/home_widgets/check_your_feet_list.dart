import 'package:drfootapp/models/check_your_feet_model.dart';
import 'package:drfootapp/screens/check_your_feet/check_your_feet_detail_screen.dart';
import 'package:drfootapp/screens/check_your_feet/check_your_feet_widget.dart';
import 'package:drfootapp/screens/check_your_feet/foot_deformities_bg_screen.dart';
import 'package:drfootapp/screens/check_your_feet/foot_pain_bg_screen.dart';
import 'package:drfootapp/screens/check_your_feet/skin_and_nail_bg_screen.dart';
import 'package:drfootapp/screens/check_your_feet/toe_deformities_bg_screen.dart';
import 'package:drfootapp/static_data/check_your_feet_data/foot_ankle.dart';
import 'package:drfootapp/static_data/check_your_feet_data/sports_injuries.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckYourFeetList extends StatefulWidget {
  const CheckYourFeetList({super.key});

  @override
  State<CheckYourFeetList> createState() => _CheckYourFeetListState();
}

class _CheckYourFeetListState extends State<CheckYourFeetList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Expanded(
          child: GridView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3 / 4.3,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: checkYourFeetList.length,
              itemBuilder: (context, index) {
                final checkYourFeetItem = checkYourFeetList[index];
                return InkWell(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Get.to(() => const SkinAndNailBgScreen());
                        break;
                      case 1:
                        Get.to(() => const ToeDeformitiesBgScreen());
                        break;
                      case 2:
                        Get.to(() => const FootPainBgScreen());
                        break;
                      case 3:
                        Get.to(() => const FootDeformitiesBgScreen());
                        break;
                      case 4:
                        Get.to(() => CheckYourFeetDetailScreen(
                              checkYourFeetDataModel:
                                  SportsInjuries.checkYourFeetDataModelList,
                            ));
                        break;
                      case 5:
                        Get.to(() => CheckYourFeetDetailScreen(
                              checkYourFeetDataModel:
                                  FootAnkle.checkYourFeetDataModelList,
                            ));
                        break;
                      default:
                        break;
                    }
                  },
                  child: CheckYourFeetWidget(
                    image: checkYourFeetItem.image,
                    title: checkYourFeetItem.serviceNames,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
