import 'package:flutter/material.dart';

class BlueView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blue View"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "This is BLUE screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
