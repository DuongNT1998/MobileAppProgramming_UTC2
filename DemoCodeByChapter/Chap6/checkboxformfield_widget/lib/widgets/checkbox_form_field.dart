import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    super.key,
    required String title,
    FormFieldValidator<bool>? validator,
    bool initialValue = false,
    ValueChanged<bool?>? onChanged,
  }) : super(
    initialValue: initialValue,
    validator: validator,
    builder: (FormFieldState<bool> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: state.value ?? false,
                onChanged: (bool? newValue) {
                  state.didChange(newValue);
                  if (onChanged != null) {
                    onChanged(newValue);
                  }
                },
              ),
              Expanded(
                child: Text(title),
              ),
            ],
          ),

          /// Hiển thị lỗi validate
          if (state.hasError)
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                state.errorText!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      );
    },
  );
}
