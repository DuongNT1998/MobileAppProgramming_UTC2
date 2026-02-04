import 'package:flutter/material.dart';
import '../widgets/simple_dialog_widget.dart';
import '../widgets/custom_dialog_widget.dart';

class DialogUtils {
  static void showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const SimpleDialogWidget(),
    );
  }

  static void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const CustomDialogWidget(),
    );
  }
}
