import 'package:flutter/material.dart';
import '../utils/dummy_data.dart';

class SimpleExpansionPanelList extends StatefulWidget {
  @override
  State<SimpleExpansionPanelList> createState() =>
      _SimpleExpansionPanelListState();
}

class _SimpleExpansionPanelListState
    extends State<SimpleExpansionPanelList> {
  final List<PanelData> _panels = [
    PanelData(
      title: 'Panel 1',
      content: 'Nội dung của Panel 1',
    ),
    PanelData(
      title: 'Panel 2',
      content: 'Nội dung của Panel 2',
    ),
    PanelData(
      title: 'Panel 3',
      content: 'Nội dung của Panel 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 300),
      expansionCallback: (index, isExpanded) {
        setState(() {
          _panels[index].isExpanded = !isExpanded;
        });
      },
      children: _panels.map((panel) {
        return ExpansionPanel(
          isExpanded: panel.isExpanded,
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(panel.title),
            );
          },
          body: ListTile(
            title: Text(panel.content),
          ),
        );
      }).toList(),
    );
  }
}