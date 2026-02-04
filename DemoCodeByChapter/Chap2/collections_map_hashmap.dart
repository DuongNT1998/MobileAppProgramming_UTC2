import 'dart:collection'; // Bắt buộc để dùng HashMap

void main() {
  /* =====================================================
   * 1. MAP CƠ BẢN TRONG DART
   * ===================================================== */

  // Map<Key, Value>
  // Key và Value có thể là bất kỳ kiểu dữ liệu nào
  Map<String, int> studentScores = {
    'An': 8,
    'Bình': 9,
    'Chi': 7,
  };

  // In toàn bộ Map
  print('Student scores: $studentScores');

  // Truy cập value thông qua key
  print('Điểm của An: ${studentScores['An']}');

  // Thêm phần tử mới
  studentScores['Dũng'] = 10;

  // Cập nhật giá trị
  studentScores['Chi'] = 8;

  print('Sau khi thêm & cập nhật: $studentScores');

  /* =====================================================
   * 2. DUYỆT MAP
   * ===================================================== */

  // Duyệt từng cặp key - value
  studentScores.forEach((key, value) {
    print('Sinh viên: $key - Điểm: $value');
  });

  // Lấy danh sách key
  print('Danh sách sinh viên: ${studentScores.keys}');

  // Lấy danh sách value
  print('Danh sách điểm: ${studentScores.values}');

  /* =====================================================
   * 3. HASHMAP TRONG DART
   * ===================================================== */

  // HashMap là một implementation của Map
  // Không đảm bảo thứ tự phần tử
  HashMap<String, String> capitals = HashMap();

  capitals['Vietnam'] = 'Hà Nội';
  capitals['Japan'] = 'Tokyo';
  capitals['France'] = 'Paris';

  print('\nCapitals (HashMap):');
  capitals.forEach((country, capital) {
    print('$country -> $capital');
  });

  /* =====================================================
   * 4. SO SÁNH MAP THƯỜNG VÀ HASHMAP
   * ===================================================== */

  // Map literal {} thường tạo ra LinkedHashMap
  // => GIỮ THỨ TỰ thêm vào
  Map<int, String> linkedMap = {
    1: 'One',
    2: 'Two',
    3: 'Three',
  };

  // HashMap KHÔNG GIỮ THỨ TỰ
  HashMap<int, String> hashMap = HashMap();
  hashMap[1] = 'One';
  hashMap[2] = 'Two';
  hashMap[3] = 'Three';

  print('\nLinkedHashMap (giữ thứ tự):');
  linkedMap.forEach((k, v) => print('$k -> $v'));

  print('\nHashMap (không đảm bảo thứ tự):');
  hashMap.forEach((k, v) => print('$k -> $v'));

  /* =====================================================
   * 5. KHI NÀO DÙNG MAP / HASHMAP?
   * ===================================================== */

  /*
   * - Dùng Map (mặc định):
   *   + Khi cần giữ thứ tự
   *   + Code đơn giản, dễ đọc
   *
   * - Dùng HashMap:
   *   + Khi không quan tâm thứ tự
   *   + Tối ưu truy xuất key-value
   *   + Dữ liệu lớn
   */
}