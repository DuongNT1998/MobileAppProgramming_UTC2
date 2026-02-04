import 'package:flutter/material.dart';
import '../views/home_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Navigation Demo',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
