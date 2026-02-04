import 'package:flutter/material.dart';

class LogButton extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;

  LogButton({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
