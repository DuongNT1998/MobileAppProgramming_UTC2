import 'package:flutter/material.dart';
import '../utils/animation_utils.dart';
import '../widgets/rotating_icon.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationUtils.createController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _rotationAnimation =
        AnimationUtils.createRotationAnimation(_animationController);

    /// Lặp vô hạn
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder Demo'),
      ),

      body: Center(
        child: RotatingIcon(
          rotationAnimation: _rotationAnimation,
        ),
      ),
    );
  }
}
