void main() {
  // Khởi tạo List có độ dài cố định = 3
  // Mặc định các phần tử là null
  List<int?> numbers = List<int?>.filled(3, null);

  // Gán giá trị theo index
  numbers[0] = 10;
  numbers[1] = 20;
  numbers[2] = 30;

  print(numbers); // [10, 20, 30]

  //  Không thể thêm phần tử mới
  // numbers.add(40); // ERROR: Unsupported operation

  //  Không thể xóa phần tử
  // numbers.removeAt(1); // ERROR

  //  Có thể thay đổi giá trị tại index đã tồn tại
  numbers[1] = 99;
  print(numbers); // [10, 99, 30]

  // Kiểm tra độ dài (luôn cố định)
  print(numbers.length); // 3
}