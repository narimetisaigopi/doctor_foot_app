import 'package:drfootapp/screens/nurse/dash_board_widgets/booking_widget.dart';
import 'package:drfootapp/screens/nurse/nurse_bookings/orders_nurse_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingsListWidget extends StatefulWidget {
  const BookingsListWidget({super.key});

  @override
  State<BookingsListWidget> createState() => _BookingsListWidgetState();
}

class _BookingsListWidgetState extends State<BookingsListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return BookingWidget(
              onPress: () {
                Get.to(() => const OrdersNurseScreen());
              },
            );
          }),
    );
  }
}
