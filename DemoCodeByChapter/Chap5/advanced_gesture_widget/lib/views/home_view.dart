import 'package:flutter/material.dart';
import '../widgets/gesture_box.dart';

class GestureDemoView extends StatelessWidget {
  const GestureDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Gesture Demo'),
      ),
      body: const Center(
        child: GestureBox(),
      ),
    );
  }
}