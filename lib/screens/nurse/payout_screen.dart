import 'package:flutter/material.dart';

class PayoutScreen extends StatefulWidget {
  const PayoutScreen({super.key});

  @override
  State<PayoutScreen> createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Text("Payout Screen"),
      ),
    );
  }
}