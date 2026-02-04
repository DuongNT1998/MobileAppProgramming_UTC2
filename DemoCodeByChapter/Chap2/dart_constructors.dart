// =======================================================
// DART CLASS, OBJECTS, CONSTRUCTORS DEMO
// =======================================================

class Student {
  // ===================================================
  // 1. Field Variables (Instance Variables)
  // ---------------------------------------------------
  // - Field variables là biến được khai báo trong class
  // - Mỗi object (instance) sẽ có BẢN SAO RIÊNG của chúng
  // ===================================================

  final int id;
  final String name;
  final int age;
  final String major;

  // ===================================================
  // 2. Default Constructor
  // - Không nhận tham số
  // - Gán giá trị mặc định cho field variables
  // ===================================================
  Student()
      : id = 0,
        name = 'Unknown',
        age = 0,
        major = 'Not declared';

  // ===================================================
  // 3. Parameterized Constructor
  // - Nhận tham số để khởi tạo object
  // ===================================================
  Student.parameterized(
    this.id,
    this.name,
    this.age,
    this.major,
  );

  // ===================================================
  // 4. Named Constructor
  // - Dùng để tạo object theo từng ngữ cảnh
  // ===================================================
  Student.freshman({
    required int id,
    required String name,
  })  : id = id,
        name = name,
        age = 18,
        major = 'Undeclared';

  // ===================================================
  // 5. Constant Constructor
  // - Object bất biến (immutable)
  // ===================================================
  const Student.constant({
    required this.id,
    required this.name,
    required this.age,
    required this.major,
  });

  // ===================================================
  // Instance Method
  // - Method hoạt động trên từng object cụ thể
  // ===================================================
  void displayInfo() {
    print('ID    : $id');
    print('Name  : $name');
    print('Age   : $age');
    print('Major : $major');
    print('----------------------');
  }
}

void main() {
  // ===================================================
  // 6. Objects (Instances of Class)
  // ---------------------------------------------------
  // - Object được tạo từ class
  // - Mỗi object là một INSTANCE
  // ===================================================

  // Object dùng Default Constructor
  Student student1 = Student();

  // Object dùng Parameterized Constructor
  Student student2 =
      Student.parameterized(1, 'An', 21, 'Computer Science');

  // Object dùng Named Constructor
  Student student3 =
      Student.freshman(id: 2, name: 'Binh');

  // Object dùng Constant Constructor
  const Student student4 = Student.constant(
    id: 3,
    name: 'Chi',
    age: 22,
    major: 'Data Science',
  );

  // ===================================================
  // 7. Accessing Instance (Field) Variables
  // ---------------------------------------------------
  // - Truy cập thông qua object
  // ===================================================
  print(student2.name);   // An
  print(student2.major); // Computer Science

  print('======================');

  // ===================================================
  // 8. Calling Instance Methods
  // ===================================================
  student1.displayInfo();
  student2.displayInfo();
  student3.displayInfo();
  student4.displayInfo();

  // ===================================================
  // 9. Constant Object Behavior
  // ---------------------------------------------------
  // - Các object const giống nhau sẽ trỏ cùng memory
  // ===================================================
  const Student student5 = Student.constant(
    id: 3,
    name: 'Chi',
    age: 22,
    major: 'Data Science',
  );

  print(identical(student4, student5)); // true
}
