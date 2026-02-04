//  Abstract class
// - Không thể tạo object trực tiếp từ abstract class
// - Dùng để định nghĩa "khuôn mẫu" cho các class con
abstract class Shape {
  // Thuộc tính chung cho mọi hình
  String name;

  // Constructor
  Shape(this.name);

  //  Abstract method
  // - KHÔNG có body {}
  // - Class con BẮT BUỘC phải override
  double calculateArea();

  // 3️⃣ Normal method (có thể có body)
  void display() {
    print("This is a shape named $name");
  }
}

// ==================================
// CLASS CON: Circle
// ==================================
class Circle extends Shape {
  double radius;

  Circle(String name, this.radius) : super(name);

  // BẮT BUỘC override abstract method
  @override
  double calculateArea() {
    return 3.14159 * radius * radius;
  }
}

// ==================================
// CLASS CON: Rectangle
// ==================================
class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(String name, this.width, this.height) : super(name);

  @override
  double calculateArea() {
    return width * height;
  }
}

// ==================================
// MAIN FUNCTION
// ==================================
void main() {
  //  Không được làm như thế này:
  // Shape shape = Shape("Shape"); // ERROR

//Tạo object từ class con
  Shape circle = Circle("Circle", 5);
  Shape rectangle = Rectangle("Rectangle", 4, 6);

  // Gọi method chung
  circle.display();
  print("Area: ${circle.calculateArea()}");

  print("------------------");

  rectangle.display();
  print("Area: ${rectangle.calculateArea()}");
}