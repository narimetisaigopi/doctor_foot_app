import 'package:drfootapp/screens/dash_board/treatement/ulcer/have_ulcer_bottomsheet.dart';
import 'package:drfootapp/screens/risk_checker_bottomsheet.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UlcerRiskCheckerAssesmentWidget extends StatefulWidget {
  const UlcerRiskCheckerAssesmentWidget({super.key});

  @override
  State<UlcerRiskCheckerAssesmentWidget> createState() =>
      _UlcerRiskCheckerAssesmentWidgetState();
}

class _UlcerRiskCheckerAssesmentWidgetState
    extends State<UlcerRiskCheckerAssesmentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: const Text(
            "ULCER ASSESMENT",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textBackThickColor,
            ),
          ).tr(),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () {
                    Utility.myBottomSheet(
                      context,
                      heightFactor: 0.5,
                      widget: const HaveUlcerBottomSheet(),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.haveUlcerBg,
                            borderRadius: BorderRadius.circular(32)),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 30, right: 30, top: 12, bottom: 12),
                          child: CustomImage(
                            path: AssetsConstants.have_ulcer,
                            height: 152,
                            width: 120,
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
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () {
                    Utility.myBottomSheet(
                      context,
                      heightFactor: 0.7,
                      widget: const RiskCheckerBottomSheet(),
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
                          padding: EdgeInsets.only(
                              left: 30, right: 30, top: 12, bottom: 12),
                          child: CustomImage(
                            path: AssetsConstants.risk_checker,
                            height: 152,
                            width: 120,
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
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
