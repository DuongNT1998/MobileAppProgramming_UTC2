import 'package:flutter/material.dart';
import '../views/home_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explicit Animation Demo',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
