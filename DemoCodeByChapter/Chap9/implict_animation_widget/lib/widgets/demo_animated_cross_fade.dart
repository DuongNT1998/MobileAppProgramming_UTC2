import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
class DemoAnimatedCrossFade extends StatefulWidget {
  @override
  State<DemoAnimatedCrossFade> createState() {
    return _DemoAnimatedCrossFadeState();
  }
}

class _DemoAnimatedCrossFadeState extends State<DemoAnimatedCrossFade> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('AnimatedCrossFade'),

        AnimatedCrossFade(
          duration: AppConstants.animationDuration,
          firstChild: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          secondChild: Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
          crossFadeState: _showFirst
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              _showFirst = !_showFirst;
            });
          },
          child: Text('Cross Fade'),
        ),

        Divider(),
      ],
    );
  }
}
