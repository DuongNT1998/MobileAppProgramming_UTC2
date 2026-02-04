class Student {
  // 1️⃣ Private instance variables (biến riêng tư)
  String _name;
  int _age;
  double _gpa;

  // 2️⃣ Constructor
  Student(this._name, this._age, this._gpa);

  // 3️⃣ Getter: đọc dữ liệu

  String get name {
    return _name;
  }

  int get age {
    return _age;
  }

  double get gpa {
    return _gpa;
  }

  // 4️⃣ Setter: gán dữ liệu + kiểm tra điều kiện

  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    } else {
      print('Tên không được rỗng');
    }
  }

  set age(int newAge) {
    if (newAge > 0) {
      _age = newAge;
    } else {
      print('Tuổi phải lớn hơn 0');
    }
  }

  set gpa(double newGpa) {
    if (newGpa >= 0.0 && newGpa <= 4.0) {
      _gpa = newGpa;
    } else {
      print('GPA phải nằm trong khoảng 0.0 - 4.0');
    }
  }
}


void main() {
  // Tạo đối tượng Student
  Student student = Student("An", 20, 3.5);

  // 👉 Getter (đọc dữ liệu)
  print(student.name); // An
  print(student.age);  // 20
  print(student.gpa);  // 3.5

  // 👉 Setter (ghi dữ liệu)
  student.age = 21;
  student.gpa = 3.8;

  // Gán giá trị sai để test validation
  student.gpa = 5.0;   // GPA không hợp lệ
  student.age = -1;    // Tuổi không hợp lệ
}
