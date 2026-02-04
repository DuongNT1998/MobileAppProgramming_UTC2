import 'package:flutter/material.dart';
import '../app/routes.dart';
import '../widgets/demo_box.dart';
import '../widgets/section_title.dart';
class RowColumnView extends StatelessWidget {
  const RowColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row & Column')),
      body: Column(
        children: [
          const SectionTitle('Row'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              DemoBox(color: Colors.red, text: '1'),
              DemoBox(color: Colors.green, text: '2'),
              DemoBox(color: Colors.blue, text: '3'),
            ],
          ),
          const SectionTitle('Column'),
          Column(
            children: const [
              DemoBox(color: Colors.orange, text: 'A'),
              DemoBox(color: Colors.purple, text: 'B'),
            ],
          ),
        ],
      ),
    );
  }
}
