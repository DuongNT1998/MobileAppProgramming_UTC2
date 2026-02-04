void main() {
  /*
  ============================================================
  DART COLLECTIONS: ARRAYS AS LIST – GROWABLE LIST
  ============================================================

  📌 Khái niệm:
  - Trong Dart KHÔNG có Array riêng biệt như C/C++
  - Dart dùng List để thay thế cho Array
  - Growable List là List có thể:
      ✔ thêm phần tử
      ✔ xóa phần tử
      ✔ thay đổi kích thước khi runtime
  */

  // ------------------------------------------------------------
  // 1️⃣ Khai báo Growable List (cách phổ biến nhất)
  // ------------------------------------------------------------
  List<int> numbers = [1, 2, 3];
  print('Initial list: $numbers');

  /*
  Đặc điểm:
  - Không cần khai báo kích thước
  - Tự động mở rộng khi thêm phần tử
  */

  // ------------------------------------------------------------
  // 2️⃣ Thêm phần tử vào Growable List
  // ------------------------------------------------------------
  numbers.add(4);              // thêm 1 phần tử
  numbers.addAll([5, 6, 7]);   // thêm nhiều phần tử

  print('After adding elements: $numbers');

  // ------------------------------------------------------------
  // 3️⃣ Truy cập và cập nhật phần tử
  // ------------------------------------------------------------
  print('Element at index 0: ${numbers[0]}');

  numbers[0] = 100; // cập nhật giá trị
  print('After updating index 0: $numbers');

  /*
  ⚠️ Lưu ý:
  - Index bắt đầu từ 0
  - Nếu truy cập index không tồn tại → Runtime Error
  */

  // ------------------------------------------------------------
  // 4️⃣ Xóa phần tử
  // ------------------------------------------------------------
  numbers.remove(3);      // xóa theo giá trị
  numbers.removeAt(0);    // xóa theo index
  numbers.removeLast();   // xóa phần tử cuối

  print('After removing elements: $numbers');

  // ------------------------------------------------------------
  // 5️⃣ Kiểm tra kích thước và trạng thái
  // ------------------------------------------------------------
  print('Length: ${numbers.length}');
  print('Is empty: ${numbers.isEmpty}');
  print('Is not empty: ${numbers.isNotEmpty}');

  // ------------------------------------------------------------
  // 6️⃣ Duyệt Growable List
  // ------------------------------------------------------------

  // Cách 1: for truyền thống
  for (int i = 0; i < numbers.length; i++) {
    print('Index $i -> ${numbers[i]}');
  }

  // Cách 2: for-in (khuyến nghị)
  for (var value in numbers) {
    print('Value: $value');
  }

  // Cách 3: forEach
  numbers.forEach((value) {
    print('forEach value: $value');
  });

  // ------------------------------------------------------------
  // 7️⃣ Khởi tạo Growable List rỗng
  // ------------------------------------------------------------
  List<String> names = [];
  names.add('Dart');
  names.add('Flutter');

  print('Names list: $names');
}