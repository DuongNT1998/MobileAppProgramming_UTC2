void main() {
  print("\nCASE 1");
  // When you know the exception to be thrown, use "on"
  try {
    int result = 12 ~/ 0;
    print("The result is $result");
  } on IntegerDivisionByZeroException {
    print("Cannot divide by zero");
  }

  print("\nCASE 2");
  // When you don't know the exception, use "catch"
  try {
    int result1 = 12 ~/ 0;
    print("The result is $result1");
  } catch (e) {
    print("The exception is $e");
  }

  print("\nCASE 3");
  // Using STACK TRACE
  try {
    int result1 = 12 ~/ 0;
    print("The result is $result1");
  } catch (e, s) {
    print("The exception is $e");
    print("STACK TRACE:\n$s");
  }

  print("\nCASE 4");
  // FINALLY is always executed
  try {
    int result = 12 ~/ 0;
    print("The result is $result");
  } catch (e) {
    print("The exception thrown is $e");
  } finally {
    print("This is FINALLY Clause and is always executed.");
  }

  print("\nCASE 5");
  // Custom Exception
  try {
    depositMoney(500);
  } catch (e) {
    if (e is DepositException) {
      print(e.errorMessage());
    } else {
      print(e);
    }
  }
}

// Custom Exception
class DepositException implements Exception {
  String errorMessage() {
    return "You can't enter amount less than 0";
  }
}

void depositMoney(int amount) {
  if (amount < 0) {
    throw DepositException();
  }
  print("Deposited $amount successfully");
}
