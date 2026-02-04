import 'package:flutter/material.dart';
import '../widgets/radio_form_field.dart';
import '../utils/form_validators.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _gender;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bạn đã chọn: $_gender'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio FormField Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              RadioFormField<String>(
                title: 'Giới tính',
                options: [
                  RadioOption(value: 'male', label: 'Nam'),
                  RadioOption(value: 'female', label: 'Nữ'),
                ],
                validator: FormValidators.requiredRadio,
                onChanged: (value) {
                  _gender = value;
                },
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Gửi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
