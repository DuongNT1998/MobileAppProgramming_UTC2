import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
class DemoAnimatedAlign extends StatefulWidget {
  @override
  State<DemoAnimatedAlign> createState() {
    return _DemoAnimatedAlignState();
  }
}

class _DemoAnimatedAlignState extends State<DemoAnimatedAlign> {
  Alignment _alignment = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('AnimatedAlign'),

        Container(
          width: 200,
          height: 120,
          color: Colors.grey.shade300,
          child: AnimatedAlign(
            alignment: _alignment,
            duration: AppConstants.animationDuration,
            child: Icon(
              Icons.star,
              size: 40,
              color: Colors.orange,
            ),
          ),
        ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              _alignment = _alignment == Alignment.topLeft
                  ? Alignment.bottomRight
                  : Alignment.topLeft;
            });
          },
          child: Text('Change Alignment'),
        ),

        Divider(),
      ],
    );
  }
}
