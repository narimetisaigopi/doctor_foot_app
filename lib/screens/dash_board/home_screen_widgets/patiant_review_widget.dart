import 'package:doctor_foot_app/models/homeScreenModels/patient_review_model.dart';
import 'package:doctor_foot_app/screens/dash_board/home_screen_widgets/review_widget.dart';
import 'package:flutter/material.dart';

class PatiantReviewWidget extends StatefulWidget {
  final Function() onPress;
  const PatiantReviewWidget({super.key, required this.onPress});

  @override
  State<PatiantReviewWidget> createState() => _PatiantReviewWidgetState();
}

class _PatiantReviewWidgetState extends State<PatiantReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        height: MediaQuery.of(context).size.height * 0.27,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: patientReviewsList.length,
              itemBuilder: (context, index) {
                final patientReviewsItem = patientReviewsList[index];
                return ReviewWidget(
                    image: patientReviewsItem.patientImage!,
                    name: patientReviewsItem.patientName!,
                    discr: patientReviewsItem.discription,
                    dateTime: patientReviewsItem.date!);
              }),
        ),
      ),
    );
  }
}
