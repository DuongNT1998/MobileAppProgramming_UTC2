import 'package:flutter/material.dart';
import '../widgets/grid_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Demo'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: const [
          GridItem(title: 'Home', icon: Icons.home),
          GridItem(title: 'Search', icon: Icons.search),
          GridItem(title: 'Profile', icon: Icons.person),
          GridItem(title: 'Settings', icon: Icons.settings),
        ],
      ),
    );
  }
}
