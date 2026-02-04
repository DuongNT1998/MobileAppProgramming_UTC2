import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  CounterButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
