import 'package:flutter/material.dart';
import '../utils/constants.dart';
class GestureBox extends StatefulWidget {
  const GestureBox({super.key});

  @override
  State<GestureBox> createState() => _GestureBoxState();
}

class _GestureBoxState extends State<GestureBox> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _previousScale = _scale;
      },

      onScaleUpdate: (details) {
        setState(() {
          // Zoom / Pinch
          _scale = (_previousScale * details.scale).clamp(0.5, 3.0);

          // Drag (Pan)
          _offset += details.focalPointDelta;
        });
      },

      onScaleEnd: (details) {
        // Flick (fling)
        final velocity = details.velocity.pixelsPerSecond;
        setState(() {
          _offset += Offset(
            velocity.dx * 0.01,
            velocity.dy * 0.01,
          );
        });
      },

      child: Transform.translate(
        offset: _offset,
        child: Transform.scale(
          scale: _scale,
          child: Container(
            width: 150,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'Pinch • Zoom • Flick',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
