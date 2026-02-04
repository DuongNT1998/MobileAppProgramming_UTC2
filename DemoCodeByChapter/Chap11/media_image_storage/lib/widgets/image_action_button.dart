import 'package:flutter/material.dart';

class ImageActionButton extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;

  ImageActionButton({
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
