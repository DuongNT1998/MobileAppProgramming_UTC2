import 'package:flutter/material.dart';
import '../views/input_decoration_demo_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InputDecoration Demo',
      debugShowCheckedModeBanner: false,
      home: InputDecorationDemoView(),
    );
  }
}
