import 'package:flutter/material.dart';
import '../widgets/dropdown_form_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _selectedCity;

  void _submitForm() {
    bool isValid = _formKey.currentState!.validate();

    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bạn đã chọn: $_selectedCity'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Form Demo'),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              CityDropdownFormField(
                selectedValue: _selectedCity,
                onChanged: (String? value) {
                  setState(() {
                    _selectedCity = value;
                  });
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _submitForm,
                child: Text('GỬI FORM'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
