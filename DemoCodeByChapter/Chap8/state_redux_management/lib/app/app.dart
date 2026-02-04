import 'package:flutter/material.dart';
import '../screens/counter_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redux Basic Demo',
      debugShowCheckedModeBanner: false,
      home: const CounterScreen(),
    );
  }
}
