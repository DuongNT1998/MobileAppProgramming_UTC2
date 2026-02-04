import 'package:flutter/material.dart';
import '../views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DropdownButton FornField Widget Demo',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
