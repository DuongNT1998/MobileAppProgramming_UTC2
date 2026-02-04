import 'package:flutter/material.dart';

class IncrementButtonWidget extends StatelessWidget {
  final VoidCallback onIncrease;

  IncrementButtonWidget({required this.onIncrease});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onIncrease,
      child: Text('Tăng +'),
    );
  }
}
