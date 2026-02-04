import 'package:flutter/material.dart';
import '../utils/app_constants.dart';

class BasicSliderWidget extends StatelessWidget {
  final double currentValue;
  final ValueChanged<double> onValueChanged;

  BasicSliderWidget({
    required this.currentValue,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Giá trị hiện tại: ${currentValue.toStringAsFixed(0)}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Slider(
          value: currentValue,
          min: AppConstants.sliderMinValue,
          max: AppConstants.sliderMaxValue,
          divisions: AppConstants.sliderDivisions,
          label: currentValue.toStringAsFixed(0),
          onChanged: (double newValue) {
            onValueChanged(newValue);
          },
        ),
      ],
    );
  }
}
