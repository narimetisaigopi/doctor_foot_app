import 'package:drfootapp/screens/dash_board/home_screen_widgets/riskfactors/health_moderate_screen.dart';
import 'package:drfootapp/screens/dash_board/videosScreenWidgets/watch_now_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RiskFactorScreen extends StatefulWidget {
  const RiskFactorScreen({super.key});

  @override
  State<RiskFactorScreen> createState() => _RiskFactorScreenState();
}

class _RiskFactorScreenState extends State<RiskFactorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Risk factor",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const HealthModerateWwidget(),
          resultModerate(),
          stepping(),
          next(),
          const SizedBox(height: 32),
        ]),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: CustomButton(
          bgColor: AppColors.primaryBlue,
          buttonName: "Back To Home",
          onPress: () {},
        ),
      ),
    );
  }

  Widget resultModerate() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 22.0),
              children: <TextSpan>[
                TextSpan(
                  text: 'Result -',
                  style: TextStyle(
                      color: AppColors.blackBold,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                TextSpan(
                  text: 'Moderate',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBlue,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: <TextSpan>[
                TextSpan(text: 'You are currently at '),
                TextSpan(
                  text: '24%',
                  style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: ' risk of gettinga diabetic \nfoot ulcer',
                  style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "What to do?",
            style: TextStyle(
                color: AppColors.blackBold,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Watch the fallowing vedio to prevent youeselves \nfrom daibetic foot ulcer",
            style: TextStyle(
                color: AppColors.textBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget stepping() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 348,
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.bggrey),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Step 1 :",
              style: TextStyle(
                  color: AppColors.blackBold,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Watch the fallowing vedio to prevent youeselves \nfrom daibetic foot ulcer",
              style: TextStyle(
                  color: AppColors.textBlackColors,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 12,
            ),
            WatchNowWidget()
          ],
        ),
      ),
    );
  }

  Widget next() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What is next ?",
            style: TextStyle(
                color: AppColors.blackBold,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "To prevent yourself from foot ulcer, these are 2 \mandatory steps to fallow",
            style: TextStyle(
                fontSize: 16,
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "● Book your appointment for foot scan.",
                style: TextStyle(
                    color: AppColors.textblackbook,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Book now",
                  style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "● Contact doctor for immediate respose",
            style: TextStyle(
                color: AppColors.textblackbook,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16, right: 4),
                child: Icon(
                  Icons.call,
                  size: 20,
                  color: AppColors.blackBold,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "+91-8888888888",
                  style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
