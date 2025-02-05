import 'package:drfootapp/screens/dash_board/diet_chart_screen_widgets/diet_bottom_sheet_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DietBottomsheetScreen extends StatefulWidget {
  const DietBottomsheetScreen({super.key});

  @override
  State<DietBottomsheetScreen> createState() => _DietBottomsheetScreenState();
}

class _DietBottomsheetScreenState extends State<DietBottomsheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DietBottmsheetWidget(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Incase if you want to avoid specific \nitem, please let us know",
              style: TextStyle(
                color: AppColors.black1,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          "Tell us here to avoid the  specific item",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            VerticalDivider(
                              color: AppColors.grey,
                              thickness: 1,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.attach_file_outlined,
                              size: 22,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "image",
                          style: TextStyle(
                            color: AppColors.grey2,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.grey,
                              ),
                              borderRadius: BorderRadius.circular(6)),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.edit,
                              size: 24,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    const Text(
                      "Preview",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
