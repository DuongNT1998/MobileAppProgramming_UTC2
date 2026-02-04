import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First Flutter App'),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(15.0),
        child:Text(
        'My name is Duong',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.purple,
              decoration: TextDecoration.none,
               fontWeight: FontWeight.bold,
          wordSpacing: 2,
            fontSize: 30,
          ),



        ),
      ),
      ),
    );
  }
}