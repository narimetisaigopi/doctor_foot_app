import 'package:drfootapp/screens/nurse/billing_details/count_down_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class TreatementStartedWidget extends StatefulWidget {
  const TreatementStartedWidget({super.key});

  @override
  State<TreatementStartedWidget> createState() =>
      _TreatementStartedWidgetState();
}

class _TreatementStartedWidgetState extends State<TreatementStartedWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 12, left: 160, right: 160, bottom: 12),
              child: Divider(
                thickness: 6,
                color: AppColors.black1,
              ),
            ),
            Text(
              "Treatment have been started  ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.blackBold,
              ),
            ),
            SizedBox(height: 10),
            CountDownWidget(),
            SizedBox(height: 10),
            CustomImage(
              path: AssetsConstants.treatement_started,
              height: 180,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10),
            SlideAction(
              elevation: 10,
              borderRadius: 16,
              innerColor: AppColors.slideBtnColor,
              outerColor: AppColors.primaryBlue,
              text: "Completed",
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteBgColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
