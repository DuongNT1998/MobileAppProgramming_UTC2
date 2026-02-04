import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
class DemoAnimatedTextStyle extends StatefulWidget {
  @override
  State<DemoAnimatedTextStyle> createState() {
    return _DemoAnimatedTextStyleState();
  }
}

class _DemoAnimatedTextStyleState extends State<DemoAnimatedTextStyle> {
  bool _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('AnimatedDefaultTextStyle'),

        AnimatedDefaultTextStyle(
          duration: AppConstants.animationDuration,
          style: TextStyle(
            fontSize: _isLarge ? 28 : 16,
            color: _isLarge ? Colors.red : Colors.black,
          ),
          child: Text('Hello Animation'),
        ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              _isLarge = !_isLarge;
            });
          },
          child: Text('Change Text Style'),
        ),

        Divider(),
      ],
    );
  }
}
