import 'package:flutter/material.dart';
import '../utils/dialog_result.dart';

class CustomConfirmDialog extends StatelessWidget {
  final String title;
  final String message;

  CustomConfirmDialog({
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 12),

            Text(message),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(DialogResult.no);
                  },
                  child: Text("NO"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(DialogResult.yes);
                  },
                  child: Text("YES"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
