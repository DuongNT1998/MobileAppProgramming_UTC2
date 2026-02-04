import 'package:flutter/material.dart';
import '../views/login_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form TextField Demo',
      debugShowCheckedModeBanner: false,
      home: const TextFieldDemoView(),
    );
  }
}
