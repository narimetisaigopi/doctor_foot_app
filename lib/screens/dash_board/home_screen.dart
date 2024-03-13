import 'package:doctor_foot_app/screens/dash_board/home_screen_widgets/app_bar_widget.dart';
import 'package:doctor_foot_app/screens/dash_board/home_screen_widgets/home_image.dart';
import 'package:doctor_foot_app/screens/dash_board/home_screen_widgets/patiant_review_widget.dart';
import 'package:doctor_foot_app/screens/dash_board/home_screen_widgets/all_services_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
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
                height: 20,
              ),
              const HomeImage(),
              const SizedBox(
                height: 12,
              ),
              const AllServicesWidget(),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  Strings.patientReviewsText,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
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
