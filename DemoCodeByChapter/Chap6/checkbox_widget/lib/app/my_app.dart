import 'package:flutter/material.dart';
import '../views/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkbox Widget Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
