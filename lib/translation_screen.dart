import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 10,
                      offset: Offset(2, 5),
                      color: AppColors.secondaryButton)
                ]),
            child: Center(
              child: InkWell(
                onTap: () {
                  context.locale = const Locale("te");
                  print(context.locale);
                  Navigator.pop(context);
                },
                child: const Text("తెలుగు "),
              ),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 10,
                      offset: Offset(2, 5),
                      color: AppColors.secondaryButton)
                ]),
            child: Center(
              child: InkWell(
                onTap: () {
                  context.locale = const Locale("en");
                  Navigator.pop(context);
                },
                child: const Text("English "),
              ),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 10,
                      offset: Offset(2, 5),
                      color: AppColors.secondaryButton)
                ]),
            child: InkWell(
              onTap: () {
                context.locale = const Locale("hi");
                Navigator.pop(context);
              },
              child: const Center(
                child: Text("हिन्दी "),
              ),
            ),
          )
        ],
      ),
    );
  }
}
