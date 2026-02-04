import 'package:flutter/material.dart';

class RedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Red View"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          "This is RED screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
