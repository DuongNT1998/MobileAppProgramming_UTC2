import 'package:flutter/material.dart';
import '../utils/animation_curves.dart';

class AnimatedBox extends StatefulWidget {
  @override
  State<AnimatedBox> createState() {
    return _AnimatedBoxState();
  }
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {

  //  AnimationController
  late AnimationController _animationController;

  //  Animation<double> dùng Tween
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    // Khởi tạo AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Khởi tạo Tween + Curve
    _sizeAnimation = Tween<double>(
      begin: 100.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: AppAnimationCurves.defaultCurve,
      ),
    );
  }

  // Trigger animation
  void startAnimation() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  //  Dispose – BẮT BUỘC
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //  AnimatedBuilder
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (BuildContext context, Widget? child) {

            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              color: Colors.blue,
            );
          },
        ),

        SizedBox(height: 24),

        ElevatedButton(
          onPressed: startAnimation,
          child: Text('Trigger Animation'),
        ),
      ],
    );
  }
}
