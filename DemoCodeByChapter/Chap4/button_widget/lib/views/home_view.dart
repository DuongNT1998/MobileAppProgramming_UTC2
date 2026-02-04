import 'package:flutter/material.dart';
import 'package:button_widget/views/home_view.dart';

import '../widgets/buttons_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons – Stateless Demo"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: ButtonsSection(),
      ),
    );
  }
}
