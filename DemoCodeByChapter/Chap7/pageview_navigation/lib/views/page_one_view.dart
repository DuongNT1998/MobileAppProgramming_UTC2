import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PageOneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.pageOneColor,
      child: Center(
        child: Text(
          'PAGE ONE',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
