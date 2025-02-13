import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BillingAddOnWidget extends StatefulWidget {
  const BillingAddOnWidget({super.key});

  @override
  State<BillingAddOnWidget> createState() => _BillingAddOnWidgetState();
}

class _BillingAddOnWidgetState extends State<BillingAddOnWidget> {
  List<String> items = [
    "Sponte Guate",
    "Plain Pads",
    "100ml Saline",
    "500ml Saline",
    "Roller Bandage",
    "Gloves"
  ];

  @override
  Widget build(BuildContext context) {
    List<int> quantities = List.filled(items.length, 0);

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          color: AppColors.bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  "Bill Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryBlue,
                    decorationStyle: TextDecorationStyle.double,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Service Total:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₹ 0.00",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount Amount:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₹ 0.00",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  "Add-ons",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryBlue,
                    decorationStyle: TextDecorationStyle.double,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            items[index],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (quantities[index] > 0) {
                                      quantities[index]--;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.remove, size: 15),
                              ),
                              Text(
                                quantities[index].toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantities[index]++;
                                  });
                                },
                                icon: const Icon(Icons.add, size: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
