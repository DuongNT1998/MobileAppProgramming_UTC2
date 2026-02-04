import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.focusNode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,           // Quản lý giá trị nhập
      keyboardType: keyboardType,        // Kiểu bàn phím
      validator: validator,              // Hàm validate
      inputFormatters: inputFormatters,  // Format dữ liệu nhập
      focusNode: focusNode,              // Quản lý focus
      onChanged: onChanged,              // Lắng nghe thay đổi

      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
