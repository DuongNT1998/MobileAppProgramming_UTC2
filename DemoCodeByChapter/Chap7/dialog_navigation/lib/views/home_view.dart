import 'package:flutter/material.dart';
import 'red_view.dart';
import 'green_view.dart';
import 'blue_view.dart';

class HomeView extends StatelessWidget {

  void _showColorDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return SimpleDialog(
          title: Text("Chọn màn hình"),
          children: [

            SimpleDialogOption(
              onPressed: () {
                Navigator.of(dialogContext).pop();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return RedView();
                    },
                  ),
                );
              },
              child: Text("Đi tới Red View"),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.of(dialogContext).pop();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return GreenView();
                    },
                  ),
                );
              },
              child: Text("Đi tới Green View"),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.of(dialogContext).pop();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return BlueView();
                    },
                  ),
                );
              },
              child: Text("Đi tới Blue View"),
            ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog → Route Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showColorDialog(context);
          },
          child: Text("Open Dialog"),
        ),
      ),
    );
  }
}
