import 'package:flutter/material.dart';

class IncrementButton extends StatelessWidget {
  final VoidCallback onPressed;

  IncrementButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Tăng +'),
    );
  }
}
