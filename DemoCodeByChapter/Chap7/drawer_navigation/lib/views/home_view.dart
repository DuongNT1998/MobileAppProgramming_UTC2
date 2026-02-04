import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      drawer: AppDrawer(),

      body: Center(
        child: Text(
          'Đây là màn hình Home',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
