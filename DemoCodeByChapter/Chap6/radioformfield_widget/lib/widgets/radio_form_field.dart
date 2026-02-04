import 'package:flutter/material.dart';

class RadioOption<T> {
  final T value;
  final String label;

  RadioOption({
    required this.value,
    required this.label,
  });
}

class RadioFormField<T> extends FormField<T> {
  RadioFormField({
    super.key,
    required List<RadioOption<T>> options,
    FormFieldValidator<T>? validator,
    required String title,
    T? initialValue,
    ValueChanged<T?>? onChanged,
  }) : super(
    initialValue: initialValue,
    validator: validator,
    builder: (FormFieldState<T> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Column(
            children: options.map((option) {
              return RadioListTile<T>(
                title: Text(option.label),
                value: option.value,
                groupValue: state.value,
                onChanged: (T? value) {
                  state.didChange(value);
                  if (onChanged != null) {
                    onChanged(value);
                  }
                },
              );
            }).toList(),
          ),

          if (state.hasError)
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                state.errorText ?? '',
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
