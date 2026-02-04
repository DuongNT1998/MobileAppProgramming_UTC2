import 'package:flutter/material.dart';
import '../views/radio_demo_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio Button Demo',
      debugShowCheckedModeBanner: false,
      home: const RadioDemoView(),
    );
  }
}
