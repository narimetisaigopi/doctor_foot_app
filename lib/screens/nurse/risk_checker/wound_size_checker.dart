import 'package:drfootapp/screens/nurse/risk_checker/billing_add_on_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WoundSizeChecker extends StatefulWidget {
  const WoundSizeChecker({super.key});

  @override
  State<WoundSizeChecker> createState() => _WoundSizeCheckerState();
}

class _WoundSizeCheckerState extends State<WoundSizeChecker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.black1,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            AssetsConstants.nurse_wound_checker,
            height: 112,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'What is the size of the wound?',
              style: TextStyle(fontSize: 16, color: AppColors.black1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    border: false,
                    bgColor: AppColors.buttonBg,
                    buttonName: "Small",
                    onPress: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    border: false,
                    bgColor: AppColors.buttonBg,
                    buttonName: "Med",
                    onPress: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    border: false,
                    bgColor: AppColors.buttonBg,
                    buttonName: "Large",
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 75, right: 75),
            child: CustomButton(
              buttonName: "Proceed",
              onPress: () {
                Utility.myBottomSheet(
                  context,
                  heightFactor: 0.7,
                  widget: const BillingAddOnWidget(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
