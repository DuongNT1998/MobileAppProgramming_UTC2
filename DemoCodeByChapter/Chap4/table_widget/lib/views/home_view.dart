import 'package:flutter/material.dart';
import '../widgets/simple_table_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Table Widget'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SimpleTableWidget(),
      ),
    );
  }
}
