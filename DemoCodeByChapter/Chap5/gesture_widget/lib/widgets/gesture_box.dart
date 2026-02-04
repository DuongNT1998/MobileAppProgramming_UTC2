import 'package:flutter/material.dart';
import '../utils/constants.dart';

class GestureBox extends StatefulWidget {
  const GestureBox({super.key});

  @override
  State<GestureBox> createState() => _GestureBoxState();
}

class _GestureBoxState extends State<GestureBox> {
  String message = 'Chưa có gesture';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => message = 'Tap');
      },
      onDoubleTap: () {
        setState(() => message = 'Double Tap');
      },
      onLongPress: () {
        setState(() => message = 'Long Press');
      },
      onHorizontalDragUpdate: (details) {
        setState(() => message = 'Horizontal Drag');
      },
      onVerticalDragUpdate: (details) {
        setState(() => message = 'Vertical Drag');
      },
      child: Container(
        width: 200,
        height: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.box,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
