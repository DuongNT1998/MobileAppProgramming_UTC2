import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class GridItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const GridItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.black54,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      child: Container(
        color: AppColors.tileBackground,
        child: Icon(
          icon,
          size: 48,
          color: Colors.white,
        ),
      ),
    );
  }
}
