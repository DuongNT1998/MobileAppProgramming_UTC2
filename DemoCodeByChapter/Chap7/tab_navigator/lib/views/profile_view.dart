import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is Profile Tab',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
