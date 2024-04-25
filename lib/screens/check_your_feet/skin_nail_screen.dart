import 'package:drfootapp/models/skin_and_nail_model.dart';
import 'package:drfootapp/screens/check_your_feet/check_your_feet_widget.dart';
import 'package:drfootapp/screens/check_your_feet/corns_screen.dart';
import 'package:drfootapp/screens/check_your_feet/folliculitis_screen.dart';
import 'package:drfootapp/screens/check_your_feet/ingrown_toe_nail_screen.dart';
import 'package:drfootapp/screens/check_your_feet/plantar_warts_screen.dart';
import 'package:drfootapp/screens/check_your_feet/toe_nail_fungus_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkinAndNailScreen extends StatefulWidget {
  const SkinAndNailScreen({super.key});

  @override
  State<SkinAndNailScreen> createState() => _SkinAndNailScreenState();
}

class _SkinAndNailScreenState extends State<SkinAndNailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Skin & Nail",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Expanded(
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
                  itemCount: skinAndNailList.length,
                  itemBuilder: (context, index) {
                    final skinAndNailItem = skinAndNailList[index];
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => const IngrownToeNailScreen());

                            break;
                          case 1:
                            Get.to(() => const CornsScreen());

                            break;
                          case 2:
                            Get.to(() => const PlantarWartsScreen());
                            break;
                          case 3:
                            Get.to(() => const ToeNailFungusScreen());

                            break;
                          case 4:
                            Get.to(() => const FolliculitisScreen());
                            break;
                          default:
                            break;
                        }
                      },
                      child: CheckYourFeetWidget(
                        image: skinAndNailItem.image,
                        title: skinAndNailItem.serviceNames,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
