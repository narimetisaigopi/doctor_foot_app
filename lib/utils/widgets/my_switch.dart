// ignore_for_file: must_be_immutable

import 'package:drfootapp/models/coupon_code_model.dart';

import 'package:drfootapp/utils/constants/firebase_constatns.dart';
import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  bool isExpired;
  final CouponCodeModel couponCodeModel;
  MySwitch({
    super.key,
    required this.couponCodeModel,
    this.isExpired = false,
  });

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Switch(
        value: widget.couponCodeModel.isExpired,
        onChanged: ((value) {
          setState(() {
            widget.isExpired = value;
            couponCodesCollectionReference
                .doc(widget.couponCodeModel.docId)
                .update({"isExpired": value});
          });
        }),
      ),
    );
  }
}
