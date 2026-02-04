import 'package:flutter/material.dart';
import '../widgets/agree_checkbox.dart';
import '../utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isAgreed = false;

  void _onCheckboxChanged(bool? newValue) {
    setState(() {
      _isAgreed = newValue ?? false;
    });
  }

  void _submit() {
    if (_isAgreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bạn đã đồng ý!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng tick checkbox!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AgreeCheckbox(
              value: _isAgreed,
              onChanged: _onCheckboxChanged,
              title: AppText.checkboxLabel,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Kiểm tra'),
            ),
          ],
        ),
      ),
    );
  }
}
