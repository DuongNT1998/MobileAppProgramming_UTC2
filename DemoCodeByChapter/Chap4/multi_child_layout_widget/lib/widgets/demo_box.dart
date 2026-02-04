import 'package:flutter/material.dart';

class DemoBox extends StatelessWidget {
  final Color color;
  final String text;
  final double size;

  const DemoBox({
    super.key,
    required this.color,
    required this.text,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:size,
      height: size,
      alignment: Alignment.center,
      color: color,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
