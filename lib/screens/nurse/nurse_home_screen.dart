import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class NurseHomeScreen extends StatefulWidget {
  const NurseHomeScreen({super.key});

  @override
  State<NurseHomeScreen> createState() => _NurseHomeScreenState();
}

class _NurseHomeScreenState extends State<NurseHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // goOnlineBtmAlert(),
          startBtmAlert()
        ],
      ),
    );
  }

  Widget goOnlineBtmAlert() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Start Your Service Now!!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackBold,
                ),
              ),
              Text(
                "Click here to go Online & Start",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: AppColors.blackBold,
                ),
              ),
              SizedBox(height: 12),
              CustomButton(
                buttonName: "Go Online",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget startBtmAlert() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AssetsConstants.michell_ross,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Michel Tross",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black1,
                        ),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.grey,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    "2.16 km",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey2,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "*",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackBold,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "10:00 AM - 11:00 AM",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "CAS 572/3, Door 881, Dargamitta, Ram Nagar, 8th Street, Secundrabad.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grey2,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(
                    Icons.family_restroom,
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.account_balance_sharp,
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.access_alarms_sharp,
                  )
                ],
              ),
              const SizedBox(height: 12),
              const SlideAction(
                elevation: 10,
                borderRadius: 16,
                innerColor: AppColors.slideBtnColor,
                outerColor: AppColors.primaryBlue,
                text: "Start",
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteBgColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
