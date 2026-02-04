import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/validators.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_dropdown_form_field.dart';

class StudentFormPage extends StatefulWidget {
  @override
  State<StudentFormPage> createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  String? gender;
  String? className;
  bool agreePolicy = false;
  bool receiveEmail = true;
  double weight = 50;

  DateTime? birthDate;
  File? avatarImage;

  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickAvatarImage() async {
    final XFile? pickedFile =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        avatarImage = File(pickedFile.path);
      });
    }
  }

  void submitForm() {

    bool isValid = _formKey.currentState!.validate();

    if (birthDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng chọn ngày sinh')),
      );
      return;
    }

    int age = DateTime.now().year - birthDate!.year;
    if (age < 17) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sinh viên phải từ 17 tuổi trở lên')),
      );
      return;
    }

    if (avatarImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng chọn ảnh đại diện')),
      );
      return;
    }

    if (!agreePolicy) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bạn phải đồng ý điều khoản')),
      );
      return;
    }

    if (Validators.weightValidator(weight) != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cân nặng không hợp lệ')),
      );
      return;
    }

    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form hợp lệ 🎉')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Registration Form')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              /// Ảnh đại diện
              CircleAvatar(
                radius: 50,
                backgroundImage:
                avatarImage != null ? FileImage(avatarImage!) : null,
                child: avatarImage == null
                    ? Icon(Icons.person, size: 50)
                    : null,
              ),

              SizedBox(height: 8),

              ElevatedButton(
                onPressed: pickAvatarImage,
                child: Text('Chọn ảnh đại diện'),
              ),

              SizedBox(height: 16),

              CustomTextFormField(
                controller: fullNameController,
                label: 'Họ và tên',
                validator: (value) =>
                    Validators.requiredField(value, 'Họ và tên'),
              ),

              SizedBox(height: 12),

              CustomTextFormField(
                controller: studentIdController,
                label: 'Mã số sinh viên',
                validator: (value) =>
                    Validators.requiredField(value, 'MSSV'),
              ),

              SizedBox(height: 12),

              CustomTextFormField(
                controller: emailController,
                label: 'Email',
                validator: Validators.emailValidator,
              ),

              SizedBox(height: 12),

              CustomDropdownFormField(
                label: 'Lớp',
                value: className,
                items: ['CNTT1', 'CNTT2', 'KTPM'],
                onChanged: (value) {
                  setState(() {
                    className = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Vui lòng chọn lớp';
                  }
                  return null;
                },
              ),

              SizedBox(height: 12),

              /// DatePicker
              GestureDetector(
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1990),
                    lastDate: DateTime.now(),
                  );

                  if (selectedDate != null) {
                    setState(() {
                      birthDate = selectedDate;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        birthDate == null
                            ? 'Chọn ngày sinh'
                            : '${birthDate!.day}/${birthDate!.month}/${birthDate!.year}',
                      ),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              Text('Giới tính'),
              RadioListTile(
                title: Text('Nam'),
                value: 'Nam',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('Nữ'),
                value: 'Nữ',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),

              SizedBox(height: 12),

              Text('Cân nặng: ${weight.toStringAsFixed(1)} kg'),
              Slider(
                min: 30,
                max: 150,
                value: weight,
                onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                },
              ),

              SwitchListTile(
                title: Text('Nhận email thông báo'),
                value: receiveEmail,
                onChanged: (value) {
                  setState(() {
                    receiveEmail = value;
                  });
                },
              ),

              CheckboxListTile(
                title: Text('Tôi đồng ý điều khoản'),
                value: agreePolicy,
                onChanged: (value) {
                  setState(() {
                    agreePolicy = value ?? false;
                  });
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
