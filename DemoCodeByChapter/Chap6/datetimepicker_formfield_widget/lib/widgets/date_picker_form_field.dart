import 'package:flutter/material.dart';
import '../utils/date_utils.dart';

class DatePickerFormField extends FormField<DateTime> {

  DatePickerFormField({
    Key? key,
    required String labelText,
    required FormFieldSetter<DateTime> onSaved,
    FormFieldValidator<DateTime>? validator,
  }) : super(
    key: key,
    onSaved: onSaved,
    validator: validator,
    builder: (FormFieldState<DateTime> state) {

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            labelText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 8),

          InkWell(
            onTap: () async {

              DateTime initialDate = DateTime.now();

              if (state.value != null) {
                initialDate = state.value!;
              }

              DateTime? pickedDate = await showDatePicker(
                context: state.context,
                initialDate: initialDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                state.didChange(pickedDate);
              }
            },
            child: InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                errorText: state.errorText,
              ),
              child: Text(
                state.value == null
                    ? 'Chọn ngày'
                    : DateUtilsHelper.formatDate(state.value!),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      );
    },
  );
}
