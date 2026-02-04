import 'package:flutter/material.dart';

class GreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Green View"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          "This is GREEN screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
