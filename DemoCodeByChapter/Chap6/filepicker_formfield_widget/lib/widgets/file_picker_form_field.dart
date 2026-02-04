import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../utils/app_constants.dart';

class FilePickerFormField extends FormField<List<PlatformFile>> {
  FilePickerFormField({
    Key? key,
    required FormFieldSetter<List<PlatformFile>> onSaved,
    FormFieldValidator<List<PlatformFile>>? validator,
  }) : super(
    key: key,
    onSaved: onSaved,
    validator: validator,
    initialValue: <PlatformFile>[],
    builder: (FormFieldState<List<PlatformFile>> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result =
              await FilePicker.platform.pickFiles(
                allowMultiple: false,
              );

              if (result != null) {
                List<PlatformFile> files = result.files;
                state.didChange(files);
              }
            },
            child: Text(AppConstants.selectFileLabel),
          ),

          const SizedBox(height: 8),

          if (state.value != null && state.value!.isNotEmpty)
            Text(
              'File đã chọn: ${state.value![0].name}',
              style: const TextStyle(color: Colors.green),
            ),

          if (state.hasError)
            Padding(
              padding: const EdgeInsets.only(top: 8),
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
