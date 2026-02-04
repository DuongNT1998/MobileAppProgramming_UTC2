import 'package:flutter/material.dart';
import '../widgets/draggable_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag Gesture Demo'),
      ),
      body: const SizedBox.expand(
        child: DraggableBox(),
      ),
    );
  }
}
