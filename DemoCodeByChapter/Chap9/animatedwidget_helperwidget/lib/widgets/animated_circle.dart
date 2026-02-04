import 'package:flutter/material.dart';

class AnimatedCircle extends AnimatedWidget {

  /// animation truyền vào từ bên ngoài
  final Animation<double> sizeAnimation;

  AnimatedCircle({
    Key? key,
    required this.sizeAnimation,
  }) : super(
    key: key,
    listenable: sizeAnimation,
  );

  @override
  Widget build(BuildContext context) {

    double currentSize = sizeAnimation.value;

    return Center(
      child: Container(
        width: currentSize,
        height: currentSize,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
