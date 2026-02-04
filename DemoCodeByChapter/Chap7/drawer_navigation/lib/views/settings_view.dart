import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class SettingsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),

      drawer: AppDrawer(),

      body: Center(
        child: Text(
          'Đây là màn hình Settings',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
