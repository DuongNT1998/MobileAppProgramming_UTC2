import 'package:flutter/material.dart';

import '../widgets/demo_animated_opacity.dart';
import '../widgets/demo_animated_align.dart';
import '../widgets/demo_animated_container.dart';
import '../widgets/demo_animated_padding.dart';
import '../widgets/demo_animated_positioned.dart';
import '../widgets/demo_animated_cross_fade.dart';
import '../widgets/demo_animated_size.dart';
import '../widgets/demo_animated_text_style.dart';
import '../widgets/demo_animated_physical_model.dart';
import '../widgets/demo_animated_icon.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Common Implicit Animations'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          DemoAnimatedOpacity(),
          DemoAnimatedAlign(),
          DemoAnimatedContainer(),
          DemoAnimatedPadding(),
          DemoAnimatedPositioned(),
          DemoAnimatedCrossFade(),
          DemoAnimatedSize(),
          DemoAnimatedTextStyle(),
          DemoAnimatedPhysicalModel(),
          DemoAnimatedIcon(),
        ],
      ),
    );
  }
}
