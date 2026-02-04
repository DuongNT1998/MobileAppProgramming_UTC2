import 'package:flutter/material.dart';
import '../app/routes.dart';
import '../widgets/demo_box.dart';
import '../widgets/section_title.dart';
class TableFlexView extends StatelessWidget {
  const TableFlexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Table & Flex')),
      body: Column(
        children: [
          const SectionTitle('Table'),
          Table(
            border: TableBorder.all(),
            children: const [
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8), child: Text('A')),
                Padding(padding: EdgeInsets.all(8), child: Text('B')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8), child: Text('C')),
                Padding(padding: EdgeInsets.all(8), child: Text('D')),
              ]),
            ],
          ),
          const SectionTitle('Flex'),
          Flex(
            direction: Axis.horizontal,
            children: const [
              Expanded(child: DemoBox(color: Colors.red, text: '1')),
              Expanded(child: DemoBox(color: Colors.green, text: '2')),
            ],
          ),
        ],
      ),
    );
  }
}
