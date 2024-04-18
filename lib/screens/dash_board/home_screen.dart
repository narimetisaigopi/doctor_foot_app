import 'package:drfootapp/screens/dash_board/home_screen_widgets/app_bar_widget.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/home_image.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/patiant_review_widget.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/all_services_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondary,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarWidget(),
              const SizedBox(
                height: 15,
              ),
              const HomeImage(),
              const SizedBox(
                height: 12,
              ),
              const AllServicesWidget(),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Text(
                  "patientReviewsText",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ).tr(),
              ),
              const SizedBox(
                height: 12,
              ),
              PatiantReviewWidget(
                onPress: () {},
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
