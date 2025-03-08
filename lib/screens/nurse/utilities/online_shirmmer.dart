import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OnlineShirmmer extends StatelessWidget {
  const OnlineShirmmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  _buildShimmerBox(width: 30, height: 30, borderRadius: 5),
                  const SizedBox(width: 10),
                  _buildShimmerBox(width: 100, height: 20, borderRadius: 5),
                  Spacer(),
                  _buildShimmerBox(width: 120, height: 20, borderRadius: 5),
                ],
              ),
              const SizedBox(height: 16),
              _buildShimmerBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  borderRadius: 10),
              const SizedBox(height: 16),
              _buildShimmerBox(
                  width: double.infinity, height: 400, borderRadius: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerBox(
      {required double width,
      required double height,
      double borderRadius = 10}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
