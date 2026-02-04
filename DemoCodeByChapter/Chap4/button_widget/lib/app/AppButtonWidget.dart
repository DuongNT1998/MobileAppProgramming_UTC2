import 'package:flutter/material.dart';
import '../views/home_view.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buttons Stateless Demo',
      home: const HomeView(),
    );
  }
}
