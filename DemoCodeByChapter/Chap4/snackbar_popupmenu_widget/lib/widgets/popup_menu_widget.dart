import 'package:flutter/material.dart';
import '../utils/snackbar_utils.dart';

class SimplePopupMenu extends StatelessWidget {
  const SimplePopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        SnackBarUtils.show(context, 'Bạn đã chọn: $value');
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: 'Option 1',
          child: Text('Option 1'),
        ),
        PopupMenuItem(
          value: 'Option 2',
          child: Text('Option 2'),
        ),
        PopupMenuItem(
          value: 'Option 3',
          child: Text('Option 3'),
        ),
      ],
    );
  }
}
