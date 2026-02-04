import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CityDropdownFormField extends StatelessWidget {
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const CityDropdownFormField({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,

      decoration: InputDecoration(
        labelText: 'Chọn thành phố',
        border: OutlineInputBorder(),
      ),

      items: AppConstants.cityList.map(
            (String city) {
          return DropdownMenuItem<String>(
            value: city,
            child: Text(city),
          );
        },
      ).toList(),

      onChanged: onChanged,

      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Vui lòng chọn thành phố';
        }
        return null;
      },
    );
  }
}
