import 'package:flutter/material.dart';
import '../widgets/popup_menu_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopupMenu & SnackBar'),
        actions: const [
          SimplePopupMenu(),
        ],
      ),
      body: const Center(
        child: Text(
          'Nhấn vào menu góc phải\nđể hiển thị PopupMenu',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
