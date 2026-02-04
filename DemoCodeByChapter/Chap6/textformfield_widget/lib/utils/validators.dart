class Validators {


  /// Regex kiểm tra định dạng email
  static final RegExp _emailRegex = RegExp(
    r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$',
  );


  /// Kiểm tra trường bắt buộc nhập
  /// - Trả về lỗi nếu rỗng
  /// - Trả về null nếu hợp lệ
  static String? requiredField(String? value) {
    if (value == null) {
      return 'Trường này không được để trống';
    }

    if (value.isEmpty) {
      return 'Trường này không được để trống';
    }

    return null;
  }

  /// Kiểm tra định dạng email
  /// - Không được rỗng
  /// - Phải đúng format email
  static String? email(String? value) {
    if (value == null) {
      return 'Email không được để trống';
    }

    if (value.isEmpty) {
      return 'Email không được để trống';
    }

    final bool isValidEmail = _emailRegex.hasMatch(value);

    if (!isValidEmail) {
      return 'Email không đúng định dạng';
    }

    return null;
  }
}
