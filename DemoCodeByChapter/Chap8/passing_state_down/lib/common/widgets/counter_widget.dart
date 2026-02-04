import 'package:flutter/material.dart';
import '../styles/app_text_styles.dart';

class CounterWidget extends StatelessWidget {
  final int counterValue;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  CounterWidget({
    required this.counterValue,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          counterValue.toString(),
          style: AppTextStyles.counterText,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onDecrease,
              child: Text('-', style: AppTextStyles.buttonText),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: onIncrease,
              child: Text('+', style: AppTextStyles.buttonText,),
            ),
          ],
        ),
      ],
    );
  }
}
