import 'package:flutter/material.dart';

class TabOneView extends StatelessWidget {
  const TabOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Nội dung Tab 1',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
