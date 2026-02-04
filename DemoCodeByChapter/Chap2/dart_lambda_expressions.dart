void main() {
  // ===============================
  // 1. Hàm bình thường (cách truyền thống)
  // ===============================
  int addNormal(int a, int b) {
    return a + b;
  }

  print("Normal function: ${addNormal(3, 4)}");

  // ===============================
  // 2. Lambda Expression (Arrow Function)
  // ===============================
  // Cú pháp: (parameters) => expression;
  int addLambda(int a, int b) => a + b;

  print("Lambda function: ${addLambda(3, 4)}");

  // ===============================
  // 3. Lambda với kiểu suy luận (type inference)
  // ===============================
  // Dart tự hiểu a, b là int
  var multiply = (int a, int b) => a * b;

  print("Multiply: ${multiply(3, 4)}");

  // ===============================
  // 4. Lambda dùng trong List (rất hay dùng)
  // ===============================
  List<int> numbers = [1, 2, 3, 4, 5];

  // map(): biến đổi từng phần tử
  var squares = numbers.map((n) => n * n).toList();
  print("Squares: $squares");

  // where(): lọc dữ liệu
  var evenNumbers = numbers.where((n) => n % 2 == 0).toList();
  print("Even numbers: $evenNumbers");

  // ===============================
  // 5. Lambda không có tham số
  // ===============================
  var sayHello = () => "Hello Dart!";
  print(sayHello());

  // ===============================
  // 6. Lambda trả về điều kiện (ternary)
  // ===============================
  var isAdult = (int age) => age >= 18 ? "Adult" : "Minor";
  print(isAdult(20));
  print(isAdult(15));

  // ===============================
  // 7. Lambda làm tham số cho hàm khác
  // ===============================
  calculate(10, 5, (a, b) => a + b);
  calculate(10, 5, (a, b) => a - b);
}

// Hàm nhận lambda làm tham số
void calculate(int a, int b, int Function(int, int) operation) {
  print("Result: ${operation(a, b)}");
}