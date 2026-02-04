import 'package:flutter/material.dart';
import '../navigation/tab_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabController Demo',
      debugShowCheckedModeBanner: false,
      home: TabNavigation(),
    );
  }
}
