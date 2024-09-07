import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
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
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.haveUlcerBg,
                          borderRadius: BorderRadius.circular(32)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Center(
                          child: Image.asset(
                            AssetsConstants.have_ulcer,
                            height: 142,
                            width: 100,
                          ),
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
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.riskCheckBg,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Image.asset(
                          height: 142,
                          width: 100,
                           AssetsConstants.risk_checker,
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
                )
              ],
            );
  }
}