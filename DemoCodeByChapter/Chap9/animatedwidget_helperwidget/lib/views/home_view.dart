import 'package:flutter/material.dart';
import '../utils/animation_utils.dart';
import '../widgets/animated_circle.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _sizeAnimation = AnimationUtils.createSizeAnimation(
      controller: _animationController,
    );
  }

  void _startAnimation() {
    _animationController.forward();
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
        title: Text('AnimatedWidget Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            child: AnimatedCircle(
              sizeAnimation: _sizeAnimation,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _startAnimation,
              child: Text('Bắt đầu Animation'),
            ),
          ),
        ],
      ),
    );
  }
}
