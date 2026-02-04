class Validators {
  /// Kiểm tra checkbox bắt buộc phải được chọn
  static String? requiredCheckbox(bool? value) {
    if (value == null || value == false) {
      return 'Bạn phải đồng ý để tiếp tục';
    }
    return null;
  }
}
