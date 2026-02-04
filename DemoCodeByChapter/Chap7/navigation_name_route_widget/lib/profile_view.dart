import 'package:flutter/material.dart';
import '../widgets/main_button.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: MainButton(
          title: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
