import 'package:flutter/material.dart';
import '../widgets/gesture_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Gesture Demo'),
      ),
      body: const Center(
        child: GestureBox(),
      ),
    );
  }
}
