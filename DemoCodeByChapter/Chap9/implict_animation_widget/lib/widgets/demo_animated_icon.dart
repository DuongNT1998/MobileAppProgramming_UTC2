import 'package:flutter/material.dart';
import '../utils/app_constants.dart';

class DemoAnimatedIcon extends StatefulWidget {
  @override
  State<DemoAnimatedIcon> createState() {
    return _DemoAnimatedIconState();
  }
}

class _DemoAnimatedIconState extends State<DemoAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('AnimatedIcon'),

        AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _controller,
          size: 48,
        ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              if (_isPlaying) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
              _isPlaying = !_isPlaying;
            });
          },
          child: Text('Toggle Icon'),
        ),

        Divider(),
      ],
    );
  }
}
