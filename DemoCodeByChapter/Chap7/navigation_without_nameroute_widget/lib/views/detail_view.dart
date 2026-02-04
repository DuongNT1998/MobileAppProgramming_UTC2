import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final String message;

  DetailView({
    Key? key,
    required this.message,
  }) : super(key: key);

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _goBack(context);
              },
              child: Text('Quay lại Home'),
            ),
          ],
        ),
      ),
    );
  }
}
