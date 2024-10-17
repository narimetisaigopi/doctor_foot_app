import 'package:drfootapp/models/check_your_feet_model.dart';
import 'package:drfootapp/screens/check_your_feet/ankle_arthritis_screen.dart';
import 'package:drfootapp/screens/check_your_feet/check_your_feet_widget.dart';
import 'package:drfootapp/screens/check_your_feet/foot_deformities_screen.dart';
import 'package:drfootapp/screens/check_your_feet/foot_painn_screen.dart';
import 'package:drfootapp/screens/check_your_feet/skin_nail_screen.dart';
import 'package:drfootapp/screens/check_your_feet/sports_injuries_screen.dart';
import 'package:drfootapp/screens/check_your_feet/toe_deformities_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            "Check your feet".toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.black2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 2.0),
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
                            Utility.myBottomSheet(context,
                                heightFactor: 0.7,
                                widget: const SkinAndNailScreen());
                            break;
                          case 1:
                            Utility.myBottomSheet(context,
                                heightFactor: 0.5,
                                widget: const ToeDeformitiesScreen());

                            break;
                          case 2:
                            Utility.myBottomSheet(context,
                                heightFactor: 0.4,
                                widget: const FootDeformitiesScreen());
                            break;
                          case 3:
                            Utility.myBottomSheet(context,
                                heightFactor: 0.5,
                                widget: const FootPainnScreen());
                            break;

                          case 4:
                            Get.to(() => const SportsInjuriesScreen());
                            break;
                          case 5:
                            Get.to(() => const AnkleArthritisScreen());
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
        ),
      ],
    );
  }
}
