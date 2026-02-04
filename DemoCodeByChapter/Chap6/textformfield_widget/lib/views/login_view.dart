import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../widgets/custom_text_form_field.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();


  void submitForm() {
    if (_formKey.currentState!.validate()) {
      debugPrint('Email: ${emailController.text}');
      debugPrint('Age: ${ageController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextFormField Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// Email field
              CustomTextFormField(
                controller: emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: Validators.email,
                focusNode: emailFocusNode,
                onChanged: (value) {
                  debugPrint('Email changed: $value');
                },
              ),

              const SizedBox(height: 16),

              /// Age field
              CustomTextFormField(
                controller: ageController,
                labelText: 'Age',
                keyboardType: TextInputType.number,
                validator: Validators.requiredField,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                focusNode: ageFocusNode,
                onChanged: (value) {
                  debugPrint('Age changed: $value');
                },
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
