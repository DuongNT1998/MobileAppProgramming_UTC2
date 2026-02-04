import 'package:flutter/material.dart';
import '../views/demo_form_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FilePickerFormField Widget Demo',
      debugShowCheckedModeBanner: false,
      home: DemoFormView(),
    );
  }
}
