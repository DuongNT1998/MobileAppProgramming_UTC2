import 'package:flutter/material.dart';
import '../utils/app_constants.dart';

class DemoAnimatedContainer extends StatefulWidget {
  @override
  State<DemoAnimatedContainer> createState() {
    return _DemoAnimatedContainerState();
  }
}

class _DemoAnimatedContainerState extends State<DemoAnimatedContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('AnimatedContainer'),

        AnimatedContainer(
          duration: AppConstants.animationDuration,
          width: _isExpanded ? 200 : 100,
          height: _isExpanded ? 100 : 200,
          color: _isExpanded ? Colors.green : Colors.red,
        ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text('Animate Container'),
        ),

        Divider(),
      ],
    );
  }
}
