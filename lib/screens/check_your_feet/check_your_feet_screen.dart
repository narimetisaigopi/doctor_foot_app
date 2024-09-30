import 'package:drfootapp/models/check_your_feet_model.dart';
import 'package:drfootapp/screens/check_your_feet/check_your_feet_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CheckYourFeetScreen extends StatefulWidget {
  const CheckYourFeetScreen({super.key});

  @override
  State<CheckYourFeetScreen> createState() => _CheckYourFeetScreenState();
}

class _CheckYourFeetScreenState extends State<CheckYourFeetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: AppColors.black1,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Check your feet",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            GridView.builder(
                padding: const EdgeInsets.symmetric(
                    vertical: 2.0, horizontal: 2.0),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 4.5,
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: checkYourFeetList.length,
                itemBuilder: (context, index) {
                  final checkYourFeetItem = checkYourFeetList[index];
                  return InkWell(
                    onTap: () {
                      switch (index) {
                    
                      }
                    },
                    child: CheckYourFeetWidget(
                      image: checkYourFeetItem.image,
                      title: checkYourFeetItem.serviceNames,
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
