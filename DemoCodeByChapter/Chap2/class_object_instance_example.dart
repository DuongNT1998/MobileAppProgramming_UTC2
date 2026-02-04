// class_object_instance_example.dart

// 1️⃣ Class Student
class Student {
  // Instance variables
  int id = 0;
  String name = "";
}

// 2️⃣ Main function
void main() {
  // Object 1
  var student1 = Student(); // student1 là reference variable
  student1.id = 23;
  student1.name = "Nguyễn Văn A";

  print("Student 1: ${student1.id}, ${student1.name}");

  // Object 2
  var student2 = Student(); // One Object, student2 is reference variable
  student2.id = 45;
  student2.name = "Trần Thị B";

  print("Student 2: ${student2.id}, ${student2.name}");

  // Reference variable trỏ cùng object
  var student3 = student1;
  student3.name = "Nguyễn Văn A (Updated)";

  print("After update via student3:");
  print("Student 1: ${student1.id}, ${student1.name}");
}
