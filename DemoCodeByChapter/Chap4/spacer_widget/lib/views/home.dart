import 'package:flutter/material.dart';
import '../widgets/color_box.dart';
import '../utils/app_colors.dart';

class SpacerDemoView extends StatelessWidget {
  const SpacerDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spacer Widget Demo'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),

          Row(
            children: const [
              ColorBox(color: AppColors.red),

              Spacer(), // chiếm khoảng trống còn lại

              ColorBox(color: AppColors.blue),

              Spacer(flex: 2), // chiếm gấp đôi spacer trên

              ColorBox(color: AppColors.green),
            ],
          ),
        ],
      ),
    );
  }
}
