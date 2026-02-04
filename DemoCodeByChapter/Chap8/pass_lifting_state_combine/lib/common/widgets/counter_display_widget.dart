import 'package:flutter/material.dart';

class CounterDisplayWidget extends StatelessWidget {
  final int counterValue;

  CounterDisplayWidget({required this.counterValue});

  @override
  Widget build(BuildContext context) {
    return Text(
      counterValue.toString(),
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
