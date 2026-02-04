import 'package:flutter/material.dart';
import '../app/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = {
      'Row & Column': AppRoutes.rowColumn,
      'Stack & Wrap': AppRoutes.stackWrap,
      'ListView & GridView': AppRoutes.listGrid,
      'Table & Flex': AppRoutes.tableFlex,
      'Flow': AppRoutes.flow,
      'Wrap + ScrollView': AppRoutes.wrapScroll,
      'ListView Scroll': AppRoutes.listviewScroll,
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Multi-Child Layout Widgets')),
      body: ListView(
        children: items.entries.map((e) {
          return ListTile(
            title: Text(e.key),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(context, e.value),
          );
        }).toList(),
      ),
    );
  }
}
