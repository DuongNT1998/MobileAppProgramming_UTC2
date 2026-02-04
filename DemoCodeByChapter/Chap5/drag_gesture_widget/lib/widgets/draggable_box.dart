import 'package:flutter/material.dart';

class DraggableBox extends StatefulWidget {
  const DraggableBox({super.key});

  @override
  State<DraggableBox> createState() => _DraggableBoxState();
}

class _DraggableBoxState extends State<DraggableBox> {
  double x = 100;
  double y = 100;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: x,
          top: y,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                x += details.delta.dx;
                y += details.delta.dy;
              });
            },
            child: Container(
              width: 120,
              height: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Drag me\n(${x.toInt()}, ${y.toInt()})',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
