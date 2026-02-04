import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
import '../widgets/form_switch_item.dart';

class SwitchFormView extends StatefulWidget {
  @override
  _SwitchFormViewState createState() => _SwitchFormViewState();
}

class _SwitchFormViewState extends State<SwitchFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isAccepted = false;

  void _submitForm() {
    if (_isAccepted == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bạn phải bật switch để tiếp tục'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Form hợp lệ!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FormSwitchItem(
                title: AppConstants.switchLabel,
                value: _isAccepted,
                onChanged: (bool newValue) {
                  setState(() {
                    _isAccepted = newValue;
                  });
                },
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Gửi form'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
