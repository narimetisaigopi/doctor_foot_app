import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ToeNailFungusScreen extends StatefulWidget {
  const ToeNailFungusScreen({super.key});

  @override
  State<ToeNailFungusScreen> createState() => _ToeNailFungusScreenState();
}

class _ToeNailFungusScreenState extends State<ToeNailFungusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Toe Nail fungus",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ).tr(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgImageWidget(
              height: 236,
              width: double.infinity,
              path: AssetsConstants.diabetes_image,
            ),
            SizedBox(height: 8,),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Ingrown Toe Nails:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackBold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Toenail fungus is a widespread fungal infection that affects your toenails. Less commonly, nail fungus can infect your fingernails. Toenail fungus happens when fungi get between your toenail and your toenail bed (the tissue right underneath your toenail). This usually happens through a crack or cut in your toe",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Most fungal nail infections are not serious. However, some people may experience pain or be bothered by the appearance of their nails.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                    SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Fungal nail infections may cause nails to become discolored, thick, fragile, or cracked. The nail may also become separated from the nail bed. ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "People who have fungal toenail infections often have a fungal skin infection on the foot, especially between the toes (commonly called athlete’s foot, ringworm on the foot, or tinea pedis). ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                   SizedBox(
                    height: 34,
                  ),
                  CustomButton(
                    buttonName: "Next",
                    isBoxShadow: false,
                  ),
                   SizedBox(
                    height: 34,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
