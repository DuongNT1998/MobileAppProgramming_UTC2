import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class DemoCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DemoCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.card,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
