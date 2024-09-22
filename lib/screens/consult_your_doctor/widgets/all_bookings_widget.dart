import 'package:drfootapp/screens/consult_your_doctor/widgets/book_now_widget.dart';
import 'package:flutter/material.dart';

class AllBookingsWidget extends StatefulWidget {
  const AllBookingsWidget({super.key});

  @override
  State<AllBookingsWidget> createState() => _AllBookingsWidgetState();
}

class _AllBookingsWidgetState extends State<AllBookingsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const BookNowWidget();
          }),
    );
  }
}
