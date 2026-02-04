import 'package:flutter/material.dart';
import '../utils/snack_bar_util.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ElevatedButton(
          onPressed: () {
            SnackBarUtil.show(context, "ElevatedButton pressed");
          },
          child: const Text("ElevatedButton"),
        ),

        TextButton(
          onPressed: () {
            SnackBarUtil.show(context, "TextButton pressed");
          },
          child: const Text("TextButton"),
        ),

        IconButton(
          onPressed: () {
            SnackBarUtil.show(context, "IconButton pressed");
          },
          icon: const Icon(Icons.favorite),
          color: Colors.red,
        ),

        PopupMenuButton<String>(
          onSelected: (value) {
            SnackBarUtil.show(context, "Selected: $value");
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: "Option 1", child: Text("Option 1")),
            PopupMenuItem(value: "Option 2", child: Text("Option 2")),
          ],
        ),

        ButtonBar(
          children: [
            ElevatedButton(
              onPressed: () {
                SnackBarUtil.show(context, "OK pressed");
              },
              child: const Text("OK"),
            ),
            TextButton(
              onPressed: () {
                SnackBarUtil.show(context, "CANCEL pressed");
              },
              child: const Text("CANCEL"),
            ),
          ],
        ),
      ],
    );
  }
}
