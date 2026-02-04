import 'package:flutter/material.dart';
import '../app/routes.dart';
import '../widgets/demo_box.dart';
class FlowView extends StatelessWidget {
  const FlowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flow')),
      body: Flow(
        delegate: SimpleFlowDelegate(),
        children: List.generate(
          6,
              (i) => DemoBox(color: Colors.brown, text: '$i'),
        ),
      ),
    );
  }
}

class SimpleFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0;
    double y = 0;

    for (int i = 0; i < context.childCount; i++) {
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
      x += context.getChildSize(i)!.width + 10;
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
