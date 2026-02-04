import 'package:flutter/material.dart';
import '../widgets/custom_text_form_field.dart';

class InputDecorationDemoView extends StatefulWidget {
  @override
  State<InputDecorationDemoView> createState() {
    return _InputDecorationDemoViewState();
  }
}

class _InputDecorationDemoViewState extends State<InputDecorationDemoView> {
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InputDecoration Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child: ListView(
            children: [

              // -------- Demo TextFormField đầy đủ --------
              CustomTextFormField(
                labelText: 'Họ và tên',
                hintText: 'Nhập họ và tên',
                helperText: 'Ví dụ: Nguyễn Văn A',
                showError: showError,
              ),

              SizedBox(height: 24),

              // -------- UnderlineInputBorder --------
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'example@gmail.com',
                  border: UnderlineInputBorder(),
                ),
              ),

              SizedBox(height: 24),

              // -------- InputBorder.none --------
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Không có border',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade300,
                ),
              ),

              SizedBox(height: 24),

              // -------- InputDecorator Widget --------
              InputDecorator(
                decoration: InputDecoration(
                  labelText: 'InputDecorator',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Nội dung hiển thị bên trong InputDecorator'),
              ),

              SizedBox(height: 32),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showError = !showError;
                  });
                },
                child: Text('Toggle Error'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
