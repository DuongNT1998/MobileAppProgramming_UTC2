import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/demo_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                // Container + Center
                Container(
                  height: 150,
                  margin: EdgeInsets.all(40),
                  color: AppColors.primary,
                  child: const Center(
                    child: Text(
                      'Single-Child Layout Demo',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Align
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cards',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 8),

                // Card + GestureDetector
                DemoCard(
                  title: 'Tap me',
                  onTap: () {
                    debugPrint('Card tapped');
                  },
                ),

                const SizedBox(height: 16),

                // Expanded + Flexible demo (trong Row)
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        color: Colors.red,
                        child: const Center(child: Text('Expanded')),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        height: 60,
                        color: Colors.green,
                        child: const Center(child: Text('Flexible')),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Stack + Positioned
                SizedBox(
                  height: 120,
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.grey.shade300,
                      ),
                      const Positioned(
                        top: 10,
                        left: 10,
                        child: Text(
                          'Positioned Top-Left',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const Positioned(
                        bottom: 10,
                        right: 10,
                        child: Icon(Icons.star, size: 32),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
