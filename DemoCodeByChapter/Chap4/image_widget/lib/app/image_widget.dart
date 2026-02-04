import 'package:flutter/material.dart';
import '../views/home.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Display image with ImageWidget',
      home: const HomePage(),
    );
  }
}