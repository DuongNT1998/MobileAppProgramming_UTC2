import 'package:flutter/material.dart';

enum Gender { male, female, other }

class ChangeGenderScreen extends StatefulWidget {
  const ChangeGenderScreen({super.key});

  @override
  State<ChangeGenderScreen> createState() => _ChangeGenderScreenState();
}

class _ChangeGenderScreenState extends State<ChangeGenderScreen> {
  Gender _selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Gender')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your gender',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            _buildRadioTile(title: 'Male', value: Gender.male),

            _buildRadioTile(title: 'Female', value: Gender.female),

            _buildRadioTile(title: 'Other', value: Gender.other),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: save gender
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioTile({required String title, required Gender value}) {
    return RadioListTile<Gender>(
      title: Text(title),
      value: value,
      groupValue: _selectedGender,
      onChanged: (Gender? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedGender = newValue;
          });
        }
      },
    );
  }
}
