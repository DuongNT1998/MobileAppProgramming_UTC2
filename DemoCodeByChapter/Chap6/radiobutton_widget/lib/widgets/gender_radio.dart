import 'package:flutter/material.dart';
import '../utils/constants.dart';

class GenderRadio extends StatelessWidget {
  final Gender value;
  final Gender? groupValue;
  final String label;
  final ValueChanged<Gender?> onChanged;

  const GenderRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<Gender>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(label),
      ],
    );
  }
}
