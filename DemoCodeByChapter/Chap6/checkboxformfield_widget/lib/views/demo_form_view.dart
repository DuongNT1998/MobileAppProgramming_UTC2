import 'package:flutter/material.dart';
import '../widgets/checkbox_form_field.dart';
import '../utils/form_validators.dart';

class DemoFormView extends StatefulWidget {
  const DemoFormView({super.key});

  @override
  State<DemoFormView> createState() => _DemoFormViewState();
}

class _DemoFormViewState extends State<DemoFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _agree = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form hợp lệ ✅')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox FormField Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxFormField(
                title: 'Tôi đồng ý với điều khoản sử dụng',
                initialValue: _agree,
                validator: Validators.requiredCheckbox,
                onChanged: (value) {
                  _agree = value ?? false;
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('GỬI FORM'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
