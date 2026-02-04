// dart_collections_set_hashset.dart
// Demo về Set và HashSet trong Dart
// --------------------------------
// Set: tập hợp các phần tử *không trùng lặp*
// HashSet: một implementation cụ thể của Set, dựa trên hash

import 'dart:collection'; // cần để dùng HashSet

void main() {
  print('===== DEMO SET =====');

  //  Khởi tạo Set
  // Set không cho phép phần tử trùng lặp
  Set<int> numberSet = {1, 2, 3, 3, 4};

  // Phần tử "3" chỉ xuất hiện 1 lần
  print('numberSet: $numberSet'); // {1, 2, 3, 4}

  //  Thêm phần tử vào Set
  numberSet.add(5);
  numberSet.add(2); // 2 đã tồn tại → không thay đổi

  print('Sau khi add: $numberSet');

  //  Kiểm tra phần tử có tồn tại không
  print('Có chứa số 3 không? ${numberSet.contains(3)}');
  print('Có chứa số 10 không? ${numberSet.contains(10)}');

  //  Xóa phần tử
  numberSet.remove(1);
  print('Sau khi remove 1: $numberSet');

  //  Duyệt Set
  print('Duyệt từng phần tử trong Set:');
  for (var item in numberSet) {
    print(item);
  }

  print('\n===== DEMO HASHSET =====');

  //  Khởi tạo HashSet
  // HashSet cũng không cho phép phần tử trùng lặp
  // Thứ tự phần tử KHÔNG được đảm bảo
  HashSet<String> nameHashSet = HashSet<String>();

  nameHashSet.add('An');
  nameHashSet.add('Bình');
  nameHashSet.add('Chi');
  nameHashSet.add('An'); // trùng → bị bỏ qua

  print('nameHashSet: $nameHashSet');

  // So sánh Set literal và HashSet
  // Set literal ({}) thường đủ dùng cho đa số trường hợp
  Set<String> normalSet = {'An', 'Bình', 'Chi'};

  print('normalSet: $normalSet');

  //  Kiểm tra kiểu dữ liệu
  print('normalSet is Set: ${normalSet is Set}');
  print('nameHashSet is HashSet: ${nameHashSet is HashSet}');

  // Chuyển List sang Set để loại bỏ trùng lặp
  List<int> numbers = [1, 2, 2, 3, 4, 4, 5];
  Set<int> uniqueNumbers = numbers.toSet();

  print('List ban đầu: $numbers');
  print('Set sau khi loại trùng: $uniqueNumbers');

  //  Một số thuộc tính & method hay dùng
  print('Số phần tử trong Set: ${uniqueNumbers.length}');
  print('Set rỗng? ${uniqueNumbers.isEmpty}');
}