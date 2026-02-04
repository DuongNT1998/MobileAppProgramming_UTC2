import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String helperText;
  final bool showError;

  CustomTextFormField({
    required this.labelText,
    required this.hintText,
    required this.helperText,
    required this.showError,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        // 1. Label
        labelText: labelText,

        // 2. Hint
        hintText: hintText,

        // 3. Helper
        helperText: helperText,

        // 4. Error
        errorText: showError ? 'Dữ liệu không hợp lệ' : null,

        // 5. Prefix Icon
        prefixIcon: Icon(Icons.person),

        // 6. Suffix Icon
        suffixIcon: Icon(Icons.check_circle),

        // 7. Filled background
        filled: true,
        fillColor: AppColors.fillColor,

        // 8. Border khi bình thường
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),

        // 9. Border khi focus
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),

        // 10. Border khi lỗi
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
