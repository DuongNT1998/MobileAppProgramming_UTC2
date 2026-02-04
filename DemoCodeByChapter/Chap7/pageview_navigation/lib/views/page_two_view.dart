import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PageTwoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.pageTwoColor,
      child: Center(
        child: Text(
          'PAGE TWO',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
