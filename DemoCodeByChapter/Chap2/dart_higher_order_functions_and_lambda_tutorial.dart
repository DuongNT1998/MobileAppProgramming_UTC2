void main() {
  // =====================================
  // 1. Function có thể gán cho biến
  // =====================================
  int Function(int, int) add = (a, b) => a + b;
  print(add(3, 4));

  // =====================================
  // 2. Higher-Order Function:
  //    Hàm nhận hàm khác làm tham số
  // =====================================
  calculate(10, 5, (a, b) => a + b);
  calculate(10, 5, (a, b) => a * b);

  // =====================================
  // 3. Higher-Order Function:
  //    Hàm trả về một hàm
  // =====================================
  var multiplierBy2 = createMultiplier(2);
  var multiplierBy3 = createMultiplier(3);

  print(multiplierBy2(10)); // 20
  print(multiplierBy3(10)); // 30

  // =====================================
  // 4. Higher-Order Functions có sẵn trong List
  // =====================================
  List<int> numbers = [1, 2, 3, 4, 5];

  // map(): biến đổi từng phần tử
  var doubled = numbers.map((n) => n * 2).toList();
  print("Doubled: $doubled");

  // where(): lọc theo điều kiện
  var oddNumbers = numbers.where((n) => n % 2 != 0).toList();
  print("Odd numbers: $oddNumbers");

  // forEach(): duyệt danh sách
  numbers.forEach((n) => print("Number: $n"));

  // =====================================
  // 5. Kết hợp nhiều Higher-Order Functions
  // =====================================
  var result = numbers
      .where((n) => n > 2)
      .map((n) => n * n)
      .toList();

  print("Filtered & Squared: $result");
}

// =====================================
// Hàm bậc cao: nhận function làm tham số
// =====================================
void calculate(
  int a,
  int b,
  int Function(int, int) operation,
) {
  print("Result: ${operation(a, b)}");
}

// =====================================
// Hàm bậc cao: trả về function
// =====================================
Function createMultiplier(int factor) {
  // factor được "giữ lại" (closure)
  return (int value) => value * factor;
}
