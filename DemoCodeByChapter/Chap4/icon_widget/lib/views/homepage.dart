import 'package:flutter/material.dart';

/// Màn hình demo Icon
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon + Text'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // QUAN TRỌNG
          children: [
            Row(
              children: const [
                Icon(Icons.home, size: 28),
                SizedBox(width: 12),
                Text('Trang chủ', style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: const [
                Icon(Icons.favorite, color: Colors.red, size: 28),
                SizedBox(width: 12),
                Text('Yêu thích', style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: const [
                Icon(Icons.settings, color: Colors.blueGrey, size: 28),
                SizedBox(width: 12),
                Text('Cài đặt', style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: const [
                Icon(Icons.person, color: Colors.green, size: 28),
                SizedBox(width: 12),
                Text('Hồ sơ cá nhân', style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}