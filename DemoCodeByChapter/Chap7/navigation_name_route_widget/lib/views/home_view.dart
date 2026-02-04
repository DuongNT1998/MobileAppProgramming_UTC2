import 'package:flutter/material.dart';
import '../widgets/main_button.dart';
import '../utils/route_names.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: MainButton(
          title: 'Go to Detail',
          onPressed: () {
            Navigator.pushNamed(
              context,
              RouteNames.detail,
            );
          },
        ),
      ),
    );
  }
}
