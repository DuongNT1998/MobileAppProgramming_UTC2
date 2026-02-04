import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../widgets/file_picker_form_field.dart';
import '../utils/app_constants.dart';

class DemoFormView extends StatefulWidget {
  const DemoFormView({super.key});

  @override
  State<DemoFormView> createState() {
    return _DemoFormViewState();
  }
}

class _DemoFormViewState extends State<DemoFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<PlatformFile>? _selectedFiles;

  void _submitForm() {
    bool isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form hợp lệ, đã submit thành công'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FilePickerFormField(
                validator: (List<PlatformFile>? files) {
                  if (files == null || files.isEmpty) {
                    return AppConstants.fileRequiredError;
                  }
                  return null;
                },
                onSaved: (List<PlatformFile>? files) {
                  _selectedFiles = files;
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
