import 'package:flutter/material.dart';
import '../views/switch_form_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Switch Demo',
      debugShowCheckedModeBanner: false,
      home: SwitchFormView(),
    );
  }
}
