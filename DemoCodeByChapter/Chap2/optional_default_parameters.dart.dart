int findVolume(int length, {int breadth = 1, int height =1}) {
  print("Length is $length");
  print("Breadth is $breadth");
  print("Height is $height");

  int volume = length * (breadth) * (height);
  print("Volume is $volume");

  return volume;
}

// Optional Named Parameters
void main() {
  findVolume(10);
  print("\n---------------------");
  findVolume(10, height: 20, breadth: 5);
    print("\n---------------------");
      findVolume(10, height: 5, breadth: 20);

}
