import 'package:drfootapp/controllers/banners_controller.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/app_bar_widget.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/home_screen_banners.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/patiant_review_widget.dart';
import 'package:drfootapp/screens/dash_board/ulcer_monitoring_screen.dart';
import 'package:drfootapp/screens/home_widgets/article_and_blog_list_widget.dart';
import 'package:drfootapp/screens/home_widgets/book_premium_plan_widget.dart';
import 'package:drfootapp/screens/home_widgets/check_your_feet_list.dart';
import 'package:drfootapp/screens/home_widgets/doctor_foot_widget.dart';
import 'package:drfootapp/screens/home_widgets/health_records_list.dart';
import 'package:drfootapp/screens/home_widgets/our_services_widget.dart';
import 'package:drfootapp/screens/home_widgets/ulcer_assesment_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannersController bannersController = Get.put(BannersController());
  @override
  void initState() {
    bannersController.fetchBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWidget(),
            const HomeScreenBanners(),
            const SizedBox(height: 12),
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
            const UlcerAssesmentWidget(),
            const Divider(
              color: AppColors.riskCheckBg,
              thickness: 5,
            ),
            const OurServicesWidget(),
            const SizedBox(height: 20),
            const Divider(
              color: AppColors.riskCheckBg,
              thickness: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            BookPremiumPlanWidget(
              onPress: () {
                Get.to(
                  () => const UlcerMonitoringScreen(),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: AppColors.riskCheckBg,
              thickness: 10,
            ),
            const SizedBox(height: 12),
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
            const CheckYourFeetList(),
            const SizedBox(height: 12),
            const Divider(
              color: AppColors.riskCheckBg,
              thickness: 10,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: const Text(
                "HEALTH RECORDS",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBackThickColor,
                ),
              ).tr(),
            ),
            const HealthRecordsList(),
            const Divider(
              color: AppColors.riskCheckBg,
              thickness: 5,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: const Text(
                "Articles & Blogs",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBackThickColor,
                ),
              ).tr(),
            ),
            const SizedBox(
              height: 12,
            ),
            const ArticleAndBlogWidgetList(),
            const SizedBox(height: 12),
            const Divider(
              color: AppColors.riskCheckBg,
              thickness: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text(
                "Patient Reviews".toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ).tr(),
            ),
            const SizedBox(height: 12),
            PatiantReviewWidget(
              onPress: () {},
            ),
            const SizedBox(height: 12),
            const DoctorFootWidget(),
          ],
        ),
      ),
    );
  }
}
