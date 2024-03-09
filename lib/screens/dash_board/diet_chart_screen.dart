import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';

class DietChartScreen extends StatefulWidget {
  const DietChartScreen({super.key});

  @override
  State<DietChartScreen> createState() => _DietChartScreenState();
}

class _DietChartScreenState extends State<DietChartScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text(Strings.dietChartText),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(Strings.dietChartText),
      ),
    );
  }
}
