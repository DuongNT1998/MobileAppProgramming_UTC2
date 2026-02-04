import 'package:flutter/material.dart';
import 'package:text_widget/views/my_home_page.dart';
class UsingTextWidget extends StatelessWidget {
  const UsingTextWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}