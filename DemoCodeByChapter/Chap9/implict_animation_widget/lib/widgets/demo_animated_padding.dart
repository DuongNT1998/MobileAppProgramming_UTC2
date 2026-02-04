import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
class DemoAnimatedPadding extends StatefulWidget {
  @override
  State<DemoAnimatedPadding> createState() {
    return _DemoAnimatedPaddingState();
  }
}

class _DemoAnimatedPaddingState extends State<DemoAnimatedPadding> {
  double _paddingValue = 8.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('AnimatedPadding'),

        AnimatedPadding(
          padding: EdgeInsets.all(_paddingValue),
          duration: AppConstants.animationDuration,
          child: Container(
            color: Colors.purple,
            width: 100,
            height: 100,
          ),
        ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              _paddingValue = _paddingValue == 8.0 ? 32.0 : 8.0;
            });
          },
          child: Text('Change Padding'),
        ),

        Divider(),
      ],
    );
  }
}
