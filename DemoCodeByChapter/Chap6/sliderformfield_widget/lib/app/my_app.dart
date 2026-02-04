import 'package:flutter/material.dart';
import '../views/slider_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slider Demo',
      debugShowCheckedModeBanner: false,
      home: SliderView(),
    );
  }
}
