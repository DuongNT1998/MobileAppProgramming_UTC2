import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
import '../widgets/custom_text_field.dart';

class TextFieldDemoView extends StatefulWidget {
  const TextFieldDemoView({super.key});

  @override
  State<TextFieldDemoView> createState() => _TextFieldDemoViewState();
}

class _TextFieldDemoViewState extends State<TextFieldDemoView> {
  final TextEditingController nameController = TextEditingController();

  String currentText = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              labelText: 'Nhập tên của bạn',
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Bạn đang nhập: $currentText',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
