// ==========================
// LỚP CHA (PARENT CLASS)
// ==========================
class Animal {
  // Thuộc tính chung cho mọi động vật
  String name;
  int age;

  // Constructor của lớp Animal
  Animal(this.name, this.age);

  // Phương thức chung (có thể override)
  void makeSound() {
    print("Animal makes a sound");
  }

  // Phương thức chung khác
  void info() {
    print("Name: $name, Age: $age");
  }
}

// ==========================
// LỚP CON: DOG
// ==========================
class Dog extends Animal {
  // Thuộc tính riêng của Dog
  String breed;

  // Constructor của Dog
  // super(...) dùng để gọi constructor của lớp cha Animal
  Dog(String name, int age, this.breed) : super(name, age);

  // Override phương thức makeSound của Animal
  @override
  void makeSound() {
    print("$name says: Woof Woof");
  }

  // Phương thức riêng của Dog
  void fetch() {
    print("$name is fetching the ball!");
  }
}

// ==========================
// LỚP CON: CAT
// ==========================
class Cat extends Animal {
  // Constructor của Cat
  Cat(String name, int age) : super(name, age);

  // Override phương thức makeSound
  @override
  void makeSound() {
    print("$name says: Meow Meow");
  }

  // Phương thức riêng của Cat
  void scratch() {
    print("$name is scratching the sofa!");
  }
}

// ==========================
// HÀM MAIN
// ==========================
void main() {
  // Tạo object Dog
  Dog dog = Dog("Buddy", 3, "Golden Retriever");

  dog.info();        // kế thừa từ Animal
  dog.makeSound();   // method đã override
  dog.fetch();       // method riêng của Dog

  print("------------");

  // Tạo object Cat
  Cat cat = Cat("Mimi", 2);

  cat.info();        // kế thừa từ Animal
  cat.makeSound();   // method đã override
  cat.scratch();     // method riêng của Cat
}
