import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class PayoutScreen extends StatefulWidget {
  const PayoutScreen({super.key});

  @override
  State<PayoutScreen> createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen> {
  int _selectedIndex = 0;
  final List<String> _options = ["Daily", "Weekly", "Monthly"];
  final List<String> _earnings = ["20,000/-", "2,20,200/-", "20,20,220/-"];

  // Sample Data for the Graph
  final List<List<EarningData>> _earningsData = [
    [
      EarningData("today", 50),
      EarningData("Tue", 70),
      EarningData("Wed", 65),
      EarningData("Thu", 80),
      EarningData("Fri", 75),
      EarningData("Sat", 90),
      EarningData("Sun", 10),
    ],
    [
      EarningData("Mon", 45),
      EarningData("Tue", 94),
      EarningData("Wed", 28),
      EarningData("Thu", 85),
      EarningData("Fri", 18),
      EarningData("Sat", 58),
      EarningData("Sun", 96),
    ],
    [
      EarningData("Jan", 280),
      EarningData("Feb", 480),
      EarningData("Mar", 120),
      EarningData("Apr", 620),
      EarningData("May", 930),
      EarningData("Jun", 860),
      EarningData("Jul", 730),
      EarningData("Aug", 490),
      EarningData("Sep", 932),
      EarningData("Oct", 780),
      EarningData("Nov", 852),
      EarningData("Dec", 964),
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(8),
                selectedBorderColor: AppColors.primaryBlue,
                borderColor: AppColors.primaryBlue,
                selectedColor: AppColors.uploadBgColor1,
                fillColor: AppColors.primaryBlue,
                color: AppColors.buttonBg,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                isSelected: List.generate(
                    _options.length, (index) => index == _selectedIndex),
                onPressed: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: _options
                    .map((option) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Text(option),
                        ))
                    .toList(),
              ),
            ),
          ),
        
          // Expanded(child: _buildGraph()),

          _buildEarningsContainer(),
        ],
      ),
    );
  }

  // Widget _buildGraph() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
  //     child: SfCartesianChart(
  //       primaryXAxis: const CategoryAxis(),
  //       primaryYAxis: const NumericAxis(),
  //       tooltipBehavior: TooltipBehavior(enable: true),
  //       series: <LineSeries<EarningData, String>>[
  //         LineSeries<EarningData, String>(
  //           dataSource: _earningsData[_selectedIndex],
  //           xValueMapper: (EarningData earnings, _) => earnings.label,
  //           yValueMapper: (EarningData earnings, _) => earnings.amount,
  //           dataLabelSettings: const DataLabelSettings(isVisible: false),
  //           markerSettings: const MarkerSettings(isVisible: true),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildEarningsContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.uploadBgColor1,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryBlue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Total Earnings",
              style: TextStyle(
                  color: AppColors.black1,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.currency_rupee,
                  color: AppColors.primaryBlue, size: 20),
              Text(_earnings[_selectedIndex], // Dynamic earnings value
                  style: const TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class EarningData {
  final String label;
  final double amount;
  EarningData(this.label, this.amount);
}
