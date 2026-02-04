import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
class DemoAnimatedSize extends StatefulWidget {
  @override
  State<DemoAnimatedSize> createState() {
    return _DemoAnimatedSizeState();
  }
}

class _DemoAnimatedSizeState extends State<DemoAnimatedSize>
    with TickerProviderStateMixin {
  bool _isBig = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('AnimatedSize'),

        AnimatedSize(
          duration: AppConstants.animationDuration,
          child: Container(
            width: _isBig ? 150 : 80,
            height: _isBig ? 150 : 80,
            color: Colors.orange,
          ),
        ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              _isBig = !_isBig;
            });
          },
          child: Text('Resize'),
        ),

        Divider(),
      ],
    );
  }
}
