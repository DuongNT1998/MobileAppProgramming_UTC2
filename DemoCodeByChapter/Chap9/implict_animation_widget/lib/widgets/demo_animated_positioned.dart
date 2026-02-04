import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
class DemoAnimatedPositioned extends StatefulWidget {
  @override
  State<DemoAnimatedPositioned> createState() {
    return _DemoAnimatedPositionedState();
  }
}

class _DemoAnimatedPositionedState extends State<DemoAnimatedPositioned> {
  bool _moved = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('AnimatedPositioned'),

        Container(
          width: 200,
          height: 120,
          color: Colors.grey.shade300,
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: AppConstants.animationDuration,
                left: _moved ? 120 : 10,
                top: _moved ? 60 : 10,
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              _moved = !_moved;
            });
          },
          child: Text('Move Box'),
        ),

        Divider(),
      ],
    );
  }
}
