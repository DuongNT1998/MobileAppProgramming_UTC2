import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
class DemoAnimatedPhysicalModel extends StatefulWidget {
  @override
  State<DemoAnimatedPhysicalModel> createState() {
    return _DemoAnimatedPhysicalModelState();
  }
}

class _DemoAnimatedPhysicalModelState extends State<DemoAnimatedPhysicalModel> {
  bool _elevated = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('AnimatedPhysicalModel'),

        AnimatedPhysicalModel(
          duration: AppConstants.animationDuration,
          color: Colors.blue,
          shadowColor: Colors.black,
          elevation: _elevated ? 10 : 2,
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
          child: Container(
            width: 100,
            height: 100,
          ),
        ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              _elevated = !_elevated;
            });
          },
          child: Text('Change Elevation'),
        ),

        Divider(),
      ],
    );
  }
}
