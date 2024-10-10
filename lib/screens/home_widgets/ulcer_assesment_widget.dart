import 'package:drfootapp/screens/risk_factor_home.dart';
import 'package:drfootapp/screens/treatement/have_ulcer_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UlcerAssesmentWidget extends StatefulWidget {
  const UlcerAssesmentWidget({super.key});

  @override
  State<UlcerAssesmentWidget> createState() => _UlcerAssesmentWidgetState();
}

class _UlcerAssesmentWidgetState extends State<UlcerAssesmentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Utility.myBottomSheet(
                context,
                heightFactor: 0.5,
                widget: const HaveUlcerScreen(),
              );
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.haveUlcerBg,
                      borderRadius: BorderRadius.circular(32)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40, right: 40,top: 12,bottom: 12),
                    child: CustomImage(
                      path: AssetsConstants.have_ulcer,
                      height: 142,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "HAVE ULCER",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ).tr(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Utility.myBottomSheet(
                context,
                heightFactor: 0.7,
                widget: const RiskFactorHome(),
              );
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.riskCheckBg,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40, right: 40,top: 12,bottom: 12),
                    child: CustomImage(
                      path: AssetsConstants.risk_checker,
                      height: 142,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "RISK CHECKER",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ).tr(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
