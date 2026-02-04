import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/gender_radio.dart';

class RadioDemoView extends StatefulWidget {
  const RadioDemoView({super.key});

  @override
  State<RadioDemoView> createState() => _RadioDemoViewState();
}

class _RadioDemoViewState extends State<RadioDemoView> {

  // 👉 Giá trị đang được chọn
  Gender? _selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Button Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Chọn giới tính:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            GenderRadio(
              value: Gender.male,
              groupValue: _selectedGender,
              label: 'Nam',
              onChanged: (Gender? value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),

            GenderRadio(
              value: Gender.female,
              groupValue: _selectedGender,
              label: 'Nữ',
              onChanged: (Gender? value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),

            GenderRadio(
              value: Gender.other,
              groupValue: _selectedGender,
              label: 'Khác',
              onChanged: (Gender? value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),

            const SizedBox(height: 20),

            Text(
              'Giá trị đã chọn: $_selectedGender',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
