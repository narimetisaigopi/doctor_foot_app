import 'package:drfootapp/models/homeScreenModels/patient_review_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/review_widget.dart';
import 'package:flutter/material.dart';

class PatiantReviewWidget extends StatefulWidget {
  final Function() onPress;
  const PatiantReviewWidget({
    super.key,
    required this.onPress,
  });

  @override
  State<PatiantReviewWidget> createState() => _PatiantReviewWidgetState();
}

class _PatiantReviewWidgetState extends State<PatiantReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            final patientReviewsItem = patientReviewsList[index];
            return InkWell(
              onTap: widget.onPress,
              child: ReviewWidget(
                image: patientReviewsItem.patientImage,
                name: patientReviewsItem.patientName,
                discr: patientReviewsItem.discription,
                dateTime: patientReviewsItem.date,
              ),
            );
          }),
    );
  }
}
