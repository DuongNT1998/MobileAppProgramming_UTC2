class FormValidators {
  static String? requiredRadio(dynamic value) {
    if (value == null) {
      return 'Vui lòng chọn một giá trị';
    }
    return null;
  }
}
