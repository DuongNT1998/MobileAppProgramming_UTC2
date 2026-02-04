import 'package:flutter/material.dart';
import '../utils/dialog_utils.dart';
import '../widgets/primary_button.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog & AlertDialog Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              title: 'Show AlertDialog',
              onPressed: () => DialogUtils.showInfoDialog(context),
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              title: 'Show Confirm Dialog',
              onPressed: () => DialogUtils.showConfirmDialog(context),
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              title: 'Show Custom Dialog',
              onPressed: () => DialogUtils.showCustomDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}