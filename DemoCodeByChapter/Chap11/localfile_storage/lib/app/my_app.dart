import 'package:flutter/material.dart';
import '../views/log_view.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local File Storage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogView(),
    );
  }
}
