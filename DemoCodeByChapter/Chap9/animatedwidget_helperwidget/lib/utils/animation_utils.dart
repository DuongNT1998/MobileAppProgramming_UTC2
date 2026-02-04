import 'package:flutter/animation.dart';

class AnimationUtils {

  /// Tạo animation kích thước từ nhỏ → lớn
  static Animation<double> createSizeAnimation({
    required AnimationController controller,
  }) {
    Animation<double> animation = Tween<double>(
      begin: 50.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    return animation;
  }
}
