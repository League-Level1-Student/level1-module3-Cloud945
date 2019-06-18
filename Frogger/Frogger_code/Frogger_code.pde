class Frog {
  int xPos;
  int yPos;
  Frog(int xPos, int yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
  }
} 
Frog jumpy;


class Car {
  int xPos;
  int yPos;
  int size;
  int speed;
  Car(int xPos, int yPos, int size, int speed) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.size = size;
    this.speed = speed;
  }
  void display() 
  {
    fill(0, 255, 0);
    rect(xPos, yPos, size, 50);
  }
  void moveLeft() {
    this.xPos = xPos-speed;
    if (xPos==0) {
      this.xPos = 800;
    }
  }
  void moveRight() {
    this.xPos = xPos+speed;
    if (xPos==800) {
      this.xPos = 0;
    }
  }
  int getX(){
    return xPos;
  }
  int getY(){
    return yPos;
  }
  int getSize(){
    return size;
  }
    
  
}
Car bob = new Car(800, 50, 50, 5);
Car billy = new Car(0, 100, 50, 10);

void setup() {
  size(800, 600);
  jumpy = new Frog(width/2, height);
}

void draw() {
  background(0, 50, 200);
  fill(50, 200, 85);
  ellipse(jumpy.xPos, jumpy.yPos, 10, 10);
  bob.display();
  bob.moveLeft();
  billy.display();
  billy.moveRight();
  if(intersects(bob)==true){
    jumpy.xPos=width/2;
    jumpy.yPos=height;
  }
  if(intersects(billy)==true){
  jumpy.xPos=width/2;
  jumpy.yPos=height;
  }

}
void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP && jumpy.yPos > 0)
    {
      jumpy.yPos = jumpy.yPos - 10;
    } else if (keyCode == DOWN && jumpy.yPos < 600)
    {
      jumpy.yPos = jumpy.yPos + 10;
    } else if (keyCode == RIGHT && jumpy.xPos < 800)
    {
      jumpy.xPos = jumpy.xPos + 10;
    } else if (keyCode == LEFT && jumpy.xPos > 0)
    {
      jumpy.xPos = jumpy.xPos - 10;
    }
  }
}
boolean intersects(Car car) {
 if ((jumpy.yPos > car.getY() && jumpy.yPos < car.getY()+50) &&
                (jumpy.xPos > car.getX() && jumpy.xPos < car.getX()+car.getSize())) {
   return true;
  }
 else  {
  return false;
 }}
