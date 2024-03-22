import 'package:doctor_foot_app/admin/coupon_codes/create_coupon_code.dart';
import 'package:doctor_foot_app/admin/coupon_codes/expire_coupons.dart';
import 'package:doctor_foot_app/admin/coupon_codes/total_coupon_codes.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CouponCodesScreen extends StatefulWidget {
  const CouponCodesScreen({Key? key}) : super(key: key);

  @override
  _CouponCodesScreenState createState() => _CouponCodesScreenState();
}

class _CouponCodesScreenState extends State<CouponCodesScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coupon Codes'),
        centerTitle: true,
      ),
      body: Expanded(
        flex: 3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 10),
                ],
              ),
              width: 300,
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(options[index]),
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        selected: _selectedIndex == index,
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 7,
              child: _selectedIndex == 0
                  ? const CreateCouponCode()
                  : _selectedIndex == 1
                      ? const AllCoupons()
                      : _selectedIndex == 2
                          ? const ExpireCoupons()
                          : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewAllCouponsScreen extends StatelessWidget {
  const ViewAllCouponsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('View All Coupons Screen'),
    );
  }
}

final List<String> options = [
  'Create Coupon Code',
  'View All Coupons',
  'Expired Coupons'
];
