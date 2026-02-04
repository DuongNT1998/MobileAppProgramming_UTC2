import 'package:flutter/material.dart';

class DecrementButton extends StatelessWidget {
  final VoidCallback onPressed;

  DecrementButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Giảm -'),
    );
  }
}
