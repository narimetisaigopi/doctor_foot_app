// ignore_for_file: library_private_types_in_public_api

import 'package:drfootapp/admin/coupon_codes/create_coupon_code.dart';
import 'package:drfootapp/admin/coupon_codes/expire_coupons.dart';
import 'package:drfootapp/admin/coupon_codes/total_coupon_codes.dart';
import 'package:drfootapp/models/coupon_code_model.dart';
import 'package:flutter/material.dart';

class CouponCodesScreen extends StatefulWidget {
  const CouponCodesScreen({Key? key}) : super(key: key);

  @override
  _CouponCodesScreenState createState() => _CouponCodesScreenState();
}

class _CouponCodesScreenState extends State<CouponCodesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.edit_note_sharp,
                size: 30,
              ),
            ),
            Tab(
              icon: Icon(Icons.discount),
            ),
            Tab(
              icon: Icon(Icons.timer_off_outlined),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            CreateCouponCode(
              couponCodeModel: CouponCodeModel(),
            ),
            const TotalCouponCodes(
              isAdmins: true,
            ),
            const ExpireCoupons(),
          ],
        ),
      ),
    );
  }
}
