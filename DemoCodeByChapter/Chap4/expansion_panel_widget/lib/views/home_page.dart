import 'package:flutter/material.dart';
import '../widgets/simple_expansion_panel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionPanelList Demo'),
      ),
      body: SingleChildScrollView( // 🔥 BẮT BUỘC
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SimpleExpansionPanelList(), // ❗ bỏ const cho dễ debug
        ),
      ),
    );
  }
}