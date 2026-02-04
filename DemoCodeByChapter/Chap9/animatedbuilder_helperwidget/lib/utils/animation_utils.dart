import 'package:flutter/animation.dart';

class AnimationUtils {

  /// Tạo AnimationController
  static AnimationController createController({
    required TickerProvider vsync,
    required Duration duration,
  }) {
    return AnimationController(
      vsync: vsync,
      duration: duration,
    );
  }

  /// Tạo animation xoay từ 0 → 2π
  static Animation<double> createRotationAnimation(
      AnimationController controller,
      ) {
    return Tween<double>(
      begin: 0.0,
      end: 6.283185307179586, // 2 * PI (viết rõ, không import dart:math)
    ).animate(controller);
  }
}
