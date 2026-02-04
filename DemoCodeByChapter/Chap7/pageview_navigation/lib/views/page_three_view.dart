import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PageThreeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.pageThreeColor,
      child: Center(
        child: Text(
          'PAGE THREE',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
