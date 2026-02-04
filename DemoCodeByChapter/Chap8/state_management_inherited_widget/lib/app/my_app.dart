import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../controllers/counter_controller.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterController(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InheritedWidget Demo',
        home: HomeScreen(),
      ),
    );
  }
}
