// ======================================================
// DART CONSTRUCTORS IN INHERITANCE
// Default Constructor & Named Constructor
// ======================================================

// ==========================
// LỚP CHA (PARENT CLASS)
// ==========================
class Animal {
  String name;
  int age;

  // -------- DEFAULT CONSTRUCTOR --------
  Animal(this.name, this.age) {
    print("Animal default constructor called");
  }

  // -------- NAMED CONSTRUCTOR --------
  Animal.baby(this.name) : age = 0 {
    print("Animal named constructor (baby) called");
  }

  void info() {
    print("Name: $name, Age: $age");
  }
}

// ==========================
// LỚP CON: DOG
// ==========================
class Dog extends Animal {
  String breed;

  // -------- DEFAULT CONSTRUCTOR --------
  // BẮT BUỘC gọi constructor của lớp cha bằng super(...)
  Dog(String name, int age, this.breed) : super(name, age) {
    print("Dog default constructor called");
  }

  // -------- NAMED CONSTRUCTOR --------
  // Gọi NAMED constructor của lớp cha
  Dog.baby(String name, this.breed) : super.baby(name) {
    print("Dog named constructor (baby) called");
  }
}

// ==========================
// LỚP CON: CAT
// ==========================
class Cat extends Animal {

  // -------- DEFAULT CONSTRUCTOR --------
  Cat(String name, int age) : super(name, age) {
    print("Cat default constructor called");
  }

  // -------- NAMED CONSTRUCTOR --------
  Cat.baby(String name) : super.baby(name) {
    print("Cat named constructor (baby) called");
  }
}

// ==========================
// MAIN FUNCTION
// ==========================
void main() {
  print("=== CREATE ADULT DOG ===");
  Dog dog1 = Dog("Buddy", 3, "Golden Retriever");
  dog1.info();

  print("\n=== CREATE BABY DOG ===");
  Dog dog2 = Dog.baby("Puppy", "Husky");
  dog2.info();

  print("\n=== CREATE BABY CAT ===");
  Cat cat1 = Cat.baby("Mimi");
  cat1.info();
}
