import 'package:flutter/material.dart';

class DecrementButtonWidget extends StatelessWidget {
  final VoidCallback onDecrease;

  DecrementButtonWidget({required this.onDecrease});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onDecrease,
      child: Text('Giảm -'),
    );
  }
}
