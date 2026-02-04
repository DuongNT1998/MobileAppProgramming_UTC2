// Dart Lexical Closures Tutorial
// ---------------------------------
// Closure = Function + biến bên ngoài mà function "ghi nhớ"
// Dart dùng lexical scoping (phạm vi tĩnh)


// =====================================
// 1. Closure cơ bản: Counter
// =====================================
Function createCounter() {
  int count = 0; // biến local nhưng được closure ghi nhớ

  return () {
    count++;
    return count;
  };
}

// =====================================
// 2. Closure với tham số
// =====================================
Function createAdder(int base) {
  // base được "đóng gói" trong closure
  return (int value) => base + value;
}

// =====================================
// 3. Closure thực tế: Logger
// =====================================
Function createLogger(String level) {
  return (String message) {
    print("[$level] $message");
  };
}



void main() {
  print("===== 1. BASIC CLOSURE =====");
  var counter = createCounter();

  print(counter()); // 1
  print(counter()); // 2
  print(counter()); // 3

  print("\n===== 2. MULTIPLE CLOSURES =====");
  var counterA = createCounter();
  var counterB = createCounter();

  print(counterA()); // 1
  print(counterA()); // 2
  print(counterB()); // 1 (độc lập hoàn toàn)

  print("\n===== 3. CLOSURE WITH PARAMETER =====");
  var add10 = createAdder(10);
  var add20 = createAdder(20);

  print(add10(5));  // 15
  print(add20(5));  // 25

  print("\n===== 4. CLOSURE REMEMBERS VARIABLE =====");
  int x = 10;
  var showX = () => x;

  print(showX()); // 10
  x = 20;
  print(showX()); // 20 (closure giữ reference, không phải copy)

  print("\n===== 5. CLOSURE IN LOOP =====");
  List<Function> functions = [];

  for (int i = 0; i < 3; i++) {
    // Mỗi vòng lặp có i riêng (lexical scope)
    functions.add(() => i);
  }

  for (var f in functions) {
    print(f()); // 0, 1, 2
  }

  print("\n===== 6. PRACTICAL EXAMPLE =====");
  var loggerInfo = createLogger("INFO");
  var loggerError = createLogger("ERROR");

  loggerInfo("Application started");
  loggerError("Something went wrong");
}
