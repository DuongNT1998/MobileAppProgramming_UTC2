import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final String title;
  final BoxFit fit;

  const ImageBox({
    super.key,
    required this.title,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 150,
          color: Colors.grey,
          child: Image.asset(
            'assets/doremon.png',
            fit: fit,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
