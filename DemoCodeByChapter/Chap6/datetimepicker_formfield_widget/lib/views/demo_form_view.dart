import 'package:flutter/material.dart';
import '../widgets/date_picker_form_field.dart';

class DemoFormView extends StatefulWidget {
  @override
  _DemoFormViewState createState() {
    return _DemoFormViewState();
  }
}

class _DemoFormViewState extends State<DemoFormView> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;

  void _submitForm() {

    bool isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ngày đã chọn: $_selectedDate',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Demo DatePicker FormField'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              DatePickerFormField(
                labelText: 'Ngày sinh',
                validator: (DateTime? value) {
                  if (value == null) {
                    return 'Vui lòng chọn ngày';
                  }
                  return null;
                },
                onSaved: (DateTime? value) {
                  _selectedDate = value;
                },
              ),

              SizedBox(height: 24),

              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
