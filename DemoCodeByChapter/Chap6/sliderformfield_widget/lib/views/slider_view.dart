import 'package:flutter/material.dart';
import '../widgets/slider_widget.dart';
import '../utils/app_constants.dart';

class SliderView extends StatefulWidget {
  @override
  _SliderViewState createState() {
    return _SliderViewState();
  }
}

class _SliderViewState extends State<SliderView> {
  double _sliderValue = AppConstants.sliderMinValue;

  void _handleSliderChanged(double newValue) {
    setState(() {
      _sliderValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Slider Widget'),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: BasicSliderWidget(
          currentValue: _sliderValue,
          onValueChanged: _handleSliderChanged,
        ),
      ),
    );
  }
}
