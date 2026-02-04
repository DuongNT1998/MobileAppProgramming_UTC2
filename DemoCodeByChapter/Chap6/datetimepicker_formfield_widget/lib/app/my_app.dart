import 'package:flutter/material.dart';
import '../views/demo_form_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DatePicker Form Demo',
      debugShowCheckedModeBanner: false,
      home: DemoFormView(),
    );
  }
}
