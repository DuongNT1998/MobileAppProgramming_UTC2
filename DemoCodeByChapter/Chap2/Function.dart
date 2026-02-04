
void findPerimeter(int length, int breadth) {
  int perimeter = 2 * (length + breadth); 
  print("The perimeter is $perimeter");
}

int getArea (int length, int breadth) {
int area = length *breadth;
return area;
}

//Function as Expression
void getHalfPerimeter(int length, int breadth) => print("The half perimeter is: ${length+breadth}");



void main() {
findPerimeter (4, 2);

int rectArea = getArea(10, 5);
 print("The area is $rectArea");


getHalfPerimeter(10, 10);
}