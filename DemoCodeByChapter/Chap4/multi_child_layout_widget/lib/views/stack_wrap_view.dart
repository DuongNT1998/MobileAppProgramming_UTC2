import 'package:flutter/material.dart';
import '../app/routes.dart';
import '../widgets/demo_box.dart';
import '../widgets/section_title.dart';

class StackWrapView extends StatelessWidget {
  const StackWrapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack & Wrap')),
      body: Column(
        children: [
          const SectionTitle('Stack'),
          SizedBox(
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: const [
                DemoBox(color: Colors.red, text: 'Base', size: 100),
                Positioned(top: 10, right: 10,
                  child: DemoBox(color: Colors.blue, text: 'Top', size: 40),
                ),
              ],
            ),
          ),
          const SectionTitle('Wrap'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              8,
                  (i) => DemoBox(
                color: Colors.teal,
                text: '$i',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
