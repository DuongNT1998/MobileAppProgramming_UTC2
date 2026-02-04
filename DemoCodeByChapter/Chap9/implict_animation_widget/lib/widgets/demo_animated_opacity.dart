import 'package:flutter/material.dart';
import '../utils/app_constants.dart';

class DemoAnimatedOpacity extends StatefulWidget {
  @override
  State<DemoAnimatedOpacity> createState() {
    return _DemoAnimatedOpacityState();
  }
}

class _DemoAnimatedOpacityState extends State<DemoAnimatedOpacity> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('AnimatedOpacity'),

        AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.2,
          duration: AppConstants.animationDuration,
          curve: AppConstants.animationCurve,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Text('Toggle Opacity'),
        ),

        Divider(),
      ],
    );
  }
}
