import 'package:flutter/material.dart';
import '../utils/dialog_utils.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => DialogUtils.showSimpleDialog(context),
              child: const Text('Show SimpleDialog'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => DialogUtils.showCustomDialog(context),
              child: const Text('Show Custom Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
