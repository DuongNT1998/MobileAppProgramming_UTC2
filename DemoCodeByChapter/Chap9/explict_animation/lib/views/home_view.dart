import 'package:flutter/material.dart';
import '../widgets/animated_box.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Explicit Animation Demo'),
      ),
      body: Center(
        child: AnimatedBox(),
      ),
    );
  }
}
