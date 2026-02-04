import 'package:flutter/material.dart';
import '../widgets/main_button.dart';
import '../utils/route_names.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MainButton(
              title: 'Go to Profile',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.profile,
                );
              },
            ),
            SizedBox(height: 20),
            MainButton(
              title: 'Back to Home',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
