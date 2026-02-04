import 'package:flutter/material.dart';

class RotatingIcon extends StatelessWidget {

  final Animation<double> rotationAnimation;

  const RotatingIcon({
    Key? key,
    required this.rotationAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: rotationAnimation,

      /// child KHÔNG bị rebuild mỗi frame
      child: Icon(
        Icons.refresh,
        size: 100,
        color: Colors.blue,
      ),

      builder: (BuildContext context, Widget? child) {

        return Transform.rotate(
          angle: rotationAnimation.value,
          child: child,
        );
      },
    );
  }
}
